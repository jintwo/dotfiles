;;; flymake-mypy.el --- Flymake backend for Mypy  -*- lexical-binding: t -*-

;; Author: Eugeny Volobuev <j21@eml.cc>
;; Version: 0.1

;;; Commentary:

;;; Code:

(require 'cl-lib)
(require 'project)

(defcustom flymake-mypy-executable "mypy"
  "Path to Mypy."
  :group 'flymake-mypy
  :type 'string)

(defcustom flymake-mypy-args '("--show-column-numbers" ".")
  "Default Mypy args."
  :group 'flymake-mypy
  :type '(list string))

(defun flymake-mypy--build-regexp ()
  "Regexp for Mypy output."
  (rx (seq line-start
           ;; File
           (group
            (one-or-more nonl)
            ".py")
           ":"
           ;; Line
           (group
            (one-or-more
             (any "0-9")))
           ":"
           ;; Col
           (zero-or-more
            (seq
             (group
              (one-or-more
               (any "0-9")))
             ":"))
           " "
           ;; Type
           (group
            (or "note" "warning" "error"))
           ": "
           ;; Message
           (group
            (zero-or-more nonl))
           line-end)))

(defvar-local flymake-mypy--proc nil)

(defun flymake-mypy--backend (report-fn &rest _args)
  (unless (executable-find flymake-mypy-executable)
    (error "Cannot find mypy"))

  (when (process-live-p flymake-mypy--proc)
    (kill-process flymake-mypy--proc)
    (setq flymake-mypy--proc nil))

  (let* ((source (current-buffer))
         (filename (buffer-file-name source))
         (default-directory (caddr (project-current))))
    (save-restriction
      (widen)
	  (setq
       flymake-mypy--proc
	   (make-process
	    :name "flymake-mypy" :noquery t :connection-type 'pipe
	    :buffer (generate-new-buffer "*flymake-mypy*")
	    :command `(,flymake-mypy-executable ,@flymake-mypy-args)
	    :sentinel
	    (lambda (proc _event)
		  (when (memq (process-status proc) '(exit signal))
		    (unwind-protect
		        (if (with-current-buffer source (eq proc flymake-mypy--proc))
			        (with-current-buffer (process-buffer proc)
			          (goto-char (point-min))
			          (cl-loop
			           while (search-forward-regexp
                              (flymake-mypy--build-regexp)
                              nil t)
                       for report-type = (match-string 4)
                       for msg = (match-string 5)
			           for sourcefile = (match-string 1)
                       for (beg . end) = (flymake-diag-region
                                          source
                                          (string-to-number (match-string 2)))
                       for type = (cond ((string-match-p "warning" report-type) :warning)
                                        ((string-match-p "error" report-type) :error)
                                        (t :note))
                       when (and sourcefile (string-match-p sourcefile filename))
                       collect (flymake-make-diagnostic source beg end type (format "Mypy: %s" msg))
                       into diags
                       finally (funcall report-fn diags)))
                  (flymake-log :warning "Canceling obsolete check %s" proc))
              ;; Cleanup temp buffer
              (kill-buffer (process-buffer proc))))))))))

;;;###autoload
(defun flymake-mypy-load ()
  "Add `flymake-mypy' to `flymake-diagnostic-functions' hook."
  (add-hook 'flymake-diagnostic-functions #'flymake-mypy--backend nil t))

(provide 'flymake-mypy)
;;; flymake-mypy.el ends here
