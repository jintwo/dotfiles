;;; init-modeline.el --- mode-line config
;;; Commentary:
;;; Code:

;; stolen from https://github.com/rougier/elegant-emacs
(defun mode-line-render (left right)
  "Function to render the modeline LEFT to RIGHT."
  (concat left
          (propertize " " 'display `(space :align-to (- right ,(length right))))
          right))

;; TODO: generic collapse path func
;; (defun collapse-path (path)
;;   (let* ((comps (file-name-split path))
;;          (file-name (last comps))
;;          (prefix (mapcar (lambda (s) (substring s 0 1)) (butlast comps))))
;;     (string-join (append prefix file-name) "/")))

;; --- segments ---
;; left
;;  project
(defun j2/modeline--project ()
  (if (project-current)
      (format " %s " (project-name (project-current)))
    ""))

(defvar-local j2/modeline-project
    '(:eval (propertize (j2/modeline--project) 'face 'org-done)))

(put 'j2/modeline-project 'risky-local-variable t)

;;  buffer
(defun --file-name-short ()
  (if-let ((project (project-current)))
      (let* ((project-dir (project-root project))
             (comps (file-name-split (file-relative-name buffer-file-name project-dir)))
             (file-name (last comps))
             (prefix (mapcar (lambda (s) (substring s 0 1)) (butlast comps))))
        (string-join (append prefix file-name) "/"))
    (abbreviate-file-name (buffer-file-name))))

(defun j2/modeline--buffer-name (&optional full)
  (format "%s"
          (if buffer-file-name
              (if full
                  buffer-file-name
                (--file-name-short))
            (buffer-name))))

(defvar-local j2/modeline-buffer-name
    '(:eval (propertize (j2/modeline--buffer-name) 'face 'mode-line-buffer-id 'help-echo '(j2/modeline--buffer-name t))))

(put 'j2/modeline-buffer-name 'risky-local-variable t)

;;  modified
(defun j2/modeline--buffer-modified ()
  (if (and buffer-file-name (buffer-modified-p)) " (modified)" ""))

(defvar-local j2/modeline-buffer-modified
    '(:eval (propertize (j2/modeline--buffer-modified) 'face 'diff-changed)))

(put 'j2/modeline-buffer-modified 'risky-local-variable t)

;;  mode
(defun j2/modeline--mode ()
  (format " %s "
          (string-replace "-mode" "" (symbol-name major-mode))))

(defvar-local j2/modeline-mode
    '(:eval (propertize (j2/modeline--mode) 'face 'eat-term-faint)))

(put 'j2/modeline-mode 'risky-local-variable t)

;;  vcs (git only)
(defun j2/modeline--vcs ()
  (if (and vc-mode buffer-file-name)
      (format " %s:%s "
              (downcase (symbol-name (vc-backend buffer-file-name)))
              (car (vc-git-branches)))
    ""))

(defvar-local j2/modeline-vcs
    '(:eval (propertize (j2/modeline--vcs) 'face 'tab-bar)))

(put 'j2/modeline-vcs 'risky-local-variable t)

;; right
;;  mode-line-misc-info

;;  position
(defvar-local j2/modeline-position
    "%4l:%2c")

(put 'j2/modeline-position 'risky-local-variable t)
;; --- segments ends here ---
(setq-default mode-line-format
              '((:eval
                 (mode-line-render
                  (format-mode-line
                   (list
                    j2/modeline-project
                    j2/modeline-buffer-name
                    j2/modeline-buffer-modified
                    j2/modeline-mode
                    j2/modeline-vcs))
                  (format-mode-line
                   (list
                    mode-line-misc-info
                    j2/modeline-position
                    " "
                    mode-line-percent-position
                    "%%"))))))

;; weird shit. calculate moon phase
;; (lunar-phase 0)

;; (lunar-phase-name (nth 2 (lunar-phase (lunar-index (calendar-current-date)))))

;; (lunar-phase-name 2)

;; 1. get lunar phase list
;; 2. find two closest phases
;; 3. write in mode-line

;; (lunar-phase-list 6 2024)
;; (calendar-current-date)

(provide 'init-modeline)
;;; init-modeline.el ends here
