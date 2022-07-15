;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'org)
(require 'f)

(setq org-log-done t
      org-directory "~/Documents/org"
      base-org-agenda-files (list "inbox.org" "tasks.org" "job.org")
      org-roam-root-file "root.org"
      org-todo-keywords '((sequence "TODO(t)" "WAITING" "|" "ABANDONDED(b)" "DONE(d)"))
      org-highest-priority ?A
      org-lowest-priority ?C
      org-default-priority ?A
      org-capture-templates `(("i" "Inbox" entry (file "inbox.org") ,(concat "* %?\n" "/Entered on/ %U"))
                              ("t" "Tasks" entry (file "tasks.org") ,(concat "* TODO %?\n" "/Entered on/ %U"))))

(defun j2/jump-to-org-index ()
  (interactive)
  (find-file (f-join org-directory org-roam-root-file)))

(defun j2/org-set-checkbox ()
  "Add checkbox inplace or before selected text."
  (interactive)
  (let ((pos (if (region-active-p) (region-beginning) (point))))
    (save-excursion
      (goto-char pos)
      (insert "[ ] "))))

(defun j2/org-roam-update-agenda-files (&rest _)
  (let ((node-files (mapcar #'org-roam-node-file (org-roam-node-list))))
    (setq org-agenda-files (append base-org-agenda-files node-files))))

(advice-add 'org-agenda :before #'j2/org-roam-update-agenda-files)

(add-hook 'org-mode-hook
          (lambda () (keymap-local-set "C-c x" 'j2/org-set-checkbox)))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (f-join org-directory "roam"))
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

;; use following package as inspiration ;)
;; (use-package toc-org
;;   :defer t
;;   :hook (org-mode-hook . toc-org-mode))

;; utils
(use-package yequake
  :defer t
  :custom
  (yequake-frames '(("org-capture"
                     (buffer-fns . (yequake-org-capture))
                     (width . 0.4)
                     (height . 0.25)
                     (alpha . 0.9)
                     (frame-parameters . ((skip-taskbar . t)
                                          (sticky . t)))))))

;; org-timer
(add-hook 'org-timer-done-hook (lambda () (message "timer done!")))

;; org-checklist
(use-package org-contrib
  :config
  (require 'org-checklist))

(provide 'init-org)
;;; init-org.el ends here
