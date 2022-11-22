;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'org)
(require 'org-agenda)
(require 'f)
(require 's)

(setq org-log-done t
      org-directory "~/Documents/org"
      org-roam-root-file "root.org"
      org-todo-keywords '((sequence "TODO(t)" "WIP" "WAITING" "|" "ABANDONDED(b)" "DONE(d)"))
      org-highest-priority ?A
      org-lowest-priority ?C
      org-default-priority ?A
      org-capture-templates `(("i" "Inbox" entry (file "inbox.org") ,(concat "* %?\n" "/Entered on/ %U"))))

;; agenda
;; base-org-agenda-files (list "inbox.org" "job.org" "cal.org")
(setq base-org-agenda-files (f-files org-directory (lambda (f) (s-ends-with? "org" f))))

;; setup calendar
(require 'gnus-icalendar)
(setq gnus-icalendar-org-capture-file (f-join org-directory "cal.org")
      gnus-icalendar-org-capture-headline '("Calendar"))
(gnus-icalendar-org-setup)

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

(defun j2/org-roam-update-agenda-files (&rest _)
  (let ((node-files (org-roam-list-files)))
    (setq org-agenda-files (append base-org-agenda-files node-files))))

(advice-add 'org-agenda :before #'j2/org-roam-update-agenda-files)

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

;; org-present
;; TODO: configure me!
(use-package org-present
  :config
  (add-hook 'org-present-mode-hook
            (lambda ()
              (org-present-big)
              (org-display-inline-images)
              (org-present-hide-cursor)
              (org-present-read-only)))
  (add-hook 'org-present-mode-quit-hook
            (lambda ()
              (org-present-small)
              (org-remove-inline-images)
              (org-present-show-cursor)
              (org-present-read-write))))

(use-package ob-restclient
  :defer t)

(provide 'init-org)
;;; init-org.el ends here
