;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'org)

(setq org-log-done t)

(setq org-directory "~/Documents/org")
(setq org-agenda-files (list "inbox.org"))

;; (when (fboundp 'key-chord-mode)
;;   (key-chord-define-global "ot" 'org-agenga))

(setq org-capture-templates
      `(("i" "Inbox" entry (file "inbox.org") ,(concat "* TODO %?\n" "/Entered on/ %U"))))

(keymap-global-set "C-c c" 'org-capture)
(keymap-global-set "C-c C-a" 'org-agenda)

(defun j2/org-set-checkbox ()
  "Add checkbox inplace or before selected text."
  (interactive)
  (let ((pos (if (region-active-p) (region-beginning) (point))))
    (save-excursion
      (goto-char pos)
      (insert "[ ] "))))

(add-hook 'org-mode-hook
          (lambda () (keymap-local-set "C-c x" 'j2/org-set-checkbox)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/Documents/org"))
  :bind (:map org-mode-map
              ("C-c r l" . org-roam-buffer-toggle)
              ("C-c r f" . org-roam-node-find)
              ("C-c r g" . org-roam-graph)
              ("C-c r i" . org-roam-node-insert)
              ("C-c r c" . org-roam-capture)
              ("M-." . org-open-at-point)
              ("M-," . org-mark-ring-goto)
              ;; Dailies
              ("C-c r j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(when (featurep 'init-consult)
  (use-package consult-org-roam
    :ensure t))

(provide 'init-org)
;;; init-org.el ends here
