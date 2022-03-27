;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'org)

(setq org-log-done t)

(setq org-agenda-files (list "~/Documents/Clicktours/tasks.org"))

;; (when (fboundp 'key-chord-mode)
;;   (key-chord-define-global "ot" 'org-agenga))

(global-set-key (kbd "C-c C-a") 'org-agenda)

(defun j2/org-set-checkbox ()
  "Add checkbox inplace or before selected text."
  (interactive)
  (let ((pos (if (region-active-p) (region-beginning) (point))))
    (save-excursion
      (goto-char pos)
      (insert "[ ] "))))

(add-hook 'org-mode-hook
          (lambda () (local-set-key (kbd "C-c x") 'j2/org-set-checkbox)))

(provide 'init-org)
;;; init-org.el ends here
