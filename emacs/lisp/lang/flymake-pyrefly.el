;;; flymake-pyrefly.el --- Flymake backend for Pyrefly  -*- lexical-binding: t; -*-

;;; Code:

(require 'cl-lib)
(require 'project)

(defcustom flymake-pyrefly-executable "pyrefly"
  "Path to Pyrefly"
  :group 'flymake-pyrefly
  :type 'string)

(defcustom flymake-pyrefly-args
  '("check" "--output-format" "min-text" "--summary=none" ".")
  "Default Pyrefly args."
  :type '(list string))

;; regexp stolen from
;; Boris Shminke <boris@shminke.com>
;; URL: https://github.com/inpefess/flymake-pyrefly
(defun flymake-pyrefly--build-regexp ()
  "Regexp for Pyrefly output."
  (rx
   ;; diagnostic level (error, warn, etc)
   (group (one-or-more upper-case))
   " "
   ;; file name
   (group (one-or-more (not space)) ".py")
   ":"
   ;; line number
   (group (one-or-more digit))
   ":"
   ;; start column
   (group (one-or-more digit))
   "-"
   ;; end column
   (one-or-more digit) ": "
   ;; diagnostic message
   (group (one-or-more nonl))
   " "
   ;; error type
   (group "[" (one-or-more nonl) "]")
   line-end
   ))

(flymake-pyrefly--build-regexp)

(defvar-local flymake-pyrefly--proc nil)

(defun flymake-pyrefly--backend (report-fn &rest _args)
  (unless (executable-find flymake-pyrefly-executable)
    (error "Cannot find pyrefly"))

  (when (process-live-p flymake-pyrefly--proc)
    (kill-process flymake-pyrefly--proc)
    (setq flymake-pyrefly--proc nil))

  (let* ((source (current-buffer))
         (filename (buffer-file-name source))
         (default-directory (caddr (project-current))))
    (save-restriction
      (widen)
      (setq
       flymake-pyrefly--proc
       (make-process
        :name "flymake-pyrefly" :noquery t :connection-type 'pipe
        :buffer (generate-new-buffer " *flymake-pyrefly*")
        :command `(,flymake-pyrefly-executable ,@flymake-pyrefly-args)
        :sentinel
        (lambda (proc _event)
          (when (memq (process-status proc) '(exit signal))
            (unwind-protect
                (if (with-current-buffer source (eq proc flymake-pyrefly--proc))
                    (with-current-buffer (process-buffer proc)
                      (goto-char (point-min))
                      (cl-loop
                       while (search-forward-regexp
                              (flymake-pyrefly--build-regexp)
                              nil t)
                       for report-type = (match-string 1)
                       for msg = (match-string 5)
                       for sourcefile = (match-string 2)
                       for (beg . end) = (flymake-diag-region
                                          source
                                          (string-to-number (match-string 3)))
                       for type = (cond ((string-match-p "ERROR" report-type) :error)
                                        (t :warning))
                       for etype = (match-string 6)
                       when (and sourcefile (string-match-p sourcefile filename))
                       collect (flymake-make-diagnostic source beg end type (format "Pyrefly %s: %s" etype msg))
                       into diags
                       finally (funcall report-fn diags)))
                  (flymake-log :warning "Cancelling obsolete check %s" proc))
              ;; Cleanup temp buffer
              (kill-buffer (process-buffer proc))))))))))

;;;###autoload
(defun flymake-pyrefly-load ()
  "Add `flymake-pyrefly' to `flymake-diagnostic-functions' hook."
  (add-hook 'flymake-diagnostic-functions #'flymake-pyrefly--backend nil t))

(provide 'flymake-pyrefly)
;;; flymake-pyrefly.el ends here
