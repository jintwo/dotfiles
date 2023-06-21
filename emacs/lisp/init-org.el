;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'org)
(require 'org-agenda)
(require 'org-id)
(require 'f)
(require 's)

(setq org-log-done t
      org-directory "~/Dropbox/Org"
      org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "WAITING(g)" "|" "DONE(d)"))
      org-highest-priority ?A
      org-lowest-priority ?C
      org-default-priority ?A
      org-capture-templates `(("i" "Inbox")
                              ("it" "TODO" entry (file+headline "inbox.org" "Tasks") ,(concat "** TODO %?\n"))
                              ("il" "Link" item (file+headline "inbox.org" "Links") ,(concat "- %?\n"))
                              ("j" "Job")
                              ("jt" "TODO" entry (file+headline "job.org" "Tasks") ,(concat "** TODO %?\n")))
      org-src-preserve-indentation t
      org-startup-indented t
      org-refile-use-outline-path t
      org-outline-path-complete-in-steps t
      org-refile-targets '((org-agenda-files :maxlevel . 3))
      org-babel-load-languages '((shell . t)
                                 (python . t)
                                 (emacs-lisp . t))
      org-index-file "index.org")

;; agenda
(setq base-org-agenda-files (f-files org-directory (lambda (f) (s-ends-with? "org" f))))
(setq org-agenda-files base-org-agenda-files)

;; setup calendar
(require 'gnus-icalendar)
(setq gnus-icalendar-org-capture-file (f-join org-directory "cal.org")
      gnus-icalendar-org-capture-headline '("Calendar"))
(gnus-icalendar-org-setup)

(defun j2/jump-to-org-index ()
  (interactive)
  (find-file (f-join org-directory org-index-file)))

(defun j2/org-set-checkbox ()
  "Add checkbox inplace or before selected text."
  (interactive)
  (let ((pos (if (region-active-p) (region-beginning) (point))))
    (save-excursion
      (goto-char pos)
      (insert "[ ] "))))

(add-hook 'org-mode-hook
          (lambda ()
            (progn
              (keymap-local-set "C-c x" 'j2/org-set-checkbox)
              (display-line-numbers-mode t)
              (highlight-indent-guides-mode t))))

(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory (f-join org-directory "roam"))
  (org-roam-root-file "index.org")
  (org-roam-completion-everywhere t)
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

;; org-babel
(org-babel-do-load-languages 'org-babel-load-languages '((shell . t)))

;; following part stolen from https://isamert.net/2022/01/04/dealing-with-apis-jsons-and-databases-in-org-mode.html
(defun org-babel-execute:json (body params)
  (let ((jq (cdr (assoc :jq params)))
        (node (cdr (assoc :node params))))
    (cond (jq
           (with-temp-buffer
             ;; Insert the JSON into the temp buffer
             (insert body)
             ;; Run jq command on the whole buffer, and replace the buffer
             ;; contents with the result returned from jq
             (shell-command-on-region (point-min) (point-max) (format "jq -r \"%s\"" jq) nil 't)
             ;; Return the contents of the temp buffer as the result
             (buffer-string)))
          (node
           (with-temp-buffer
             (insert (format "const it = %s;" body))
             (insert node)
             (shell-command-on-region (point-min) (point-max) "node -p" nil 't)
             (buffer-string)))
          (t body))))

(provide 'init-org)
;;; init-org.el ends here
