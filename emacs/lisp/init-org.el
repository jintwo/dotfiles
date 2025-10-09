;;; init-org.el --- org mode config
;;; Commentary:
;;; Code:
(require 'f)
(require 's)

(use-package verb
  :ensure t)

(use-package org
  :ensure t
  :config
  (require 'org)
  (require 'org-agenda)
  (require 'org-id)

  (define-key org-mode-map (kbd "C-c C-r") verb-command-map)

  (setq org-directory "~/Sync/Org"
        org-notes-index-file "notes/notes.org" ;; TODO: move to denote?
        org-timer-file "timer.org")

  (setq org-agenda-files
        (append
         (f-files org-directory (lambda (f) (s-ends-with? "org" f))) ;; root
         (f-files (f-join org-directory "roam") (lambda (f) (s-ends-with? "org" f))))) ;; all roam stuff

  (setq org-refile-targets '((org-agenda-files :maxlevel . 6)))

  (setq org-log-done t
        org-log-into-drawer t
        org-log-redeadline 'time
        org-log-reschedule 'time
        org-src-preserve-indentation t
        org-startup-indented t
        org-goto-interface 'outline-path-completion
        org-outline-path-complete-in-steps nil
        org-image-actual-width nil
        org-insert-heading-respect-content t
        org-imenu-depth 8

        org-todo-keywords '((sequence "TODO(t)" "WIP(w!)" "WAIT(g!)" "|" "DONE(d!)" "CANCEL(c!)"))

        org-highest-priority ?A
        org-lowest-priority ?F
        org-default-priority ?E

        org-refile-use-outline-path 'file

	    org-agenda-remove-tags t
	    org-agenda-prefix-format "%-24c %?-14t% s"
	    org-agenda-todo-keyword-format "%-10s"))

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
  (require 'org-roam-protocol)

  (defun find-roam-file (title)
    (require 'org-roam)
    (org-roam-node-file (org-roam-node-from-title-or-alias title)))

  ;; setup calendar
  (require 'gnus-icalendar)
  (setq gnus-icalendar-org-capture-file (find-roam-file "calendar")
	    gnus-icalendar-org-capture-headline '("Calendar"))
  (gnus-icalendar-org-setup)

  ;; TODO split into main/job
  ;; TODO add job/task capture template with backlink
  (setq org-capture-templates `(("h" "TODO.home" entry (file+headline ,(find-roam-file "inbox") "Tasks")
				                 "** TODO %?\n")
				                ("l" "Link" item (file+headline ,(find-roam-file "inbox") "Links")
				                 "- %?\n")
				                ("j" "TODO.job" entry (file+headline ,(find-roam-file "job") "Inbox")
				                 "** TODO %?\n")
				                ("n" "Note" entry (file+datetree ,org-notes-index-file)
				                 "** %?\nEntered on %U\n"))))

;; utils
;; stolen from: https://localauthor.github.io/posts/popup-frames/
(defun popup-frame-delete (&rest _)
  "Kill selected frame if it has parameter `popup-frame'."
  (when (frame-parameter nil 'popup-frame)
    (delete-frame)))

(defmacro popup-frame-define (command title &optional delete-frame)
  "Define interactive function to call COMMAND in frame with TITLE."
  `(defun ,(intern (format "popup-frame-%s" command)) ()
     (interactive)
     (let* ((display-buffer-alist '(("")
                                    (display-buffer-full-frame)))
            (frame (make-frame
                    '((title . ,title)
                      (name . ,title)
                      (window-system . ns)
                      (skip-taskbar . t)
                      (sticky . t)
                      (popup-frame . t)))))
       (select-frame frame)
       (switch-to-buffer " popup-frame-hidden-buffer")
       (condition-case nil
           (progn
             (call-interactively ',command)
             (delete-other-windows))
         (error
          (delete-frame frame))))))

(popup-frame-define clipr-show "clipr-show")
(add-hook 'clipr-finalize-hook #'popup-frame-delete)

(popup-frame-define org-capture "org-capture")
(add-hook 'org-capture-after-finalize-hook #'popup-frame-delete)

;; export articles web->org
(use-package org-web-tools
  :ensure t)

;; org-checklist
(use-package org-contrib
  :config
  (require 'org-checklist))

;; plantuml
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))

;; disabled
;; (use-package org-re-reveal
;;   :ensure t)

;; disabled
;; (use-package dslide
;;   :ensure t
;;   :config
;;   (setq dslide-breadcrumb-separator " > "))
;;
;; (use-package master-of-ceremonies
;;   :after dslide
;;   :vc (:url "https://github.com/positron-solutions/master-of-ceremonies"
;;        :rev :newest))

;; org-babel
(setq org-babel-load-languages '((shell . t)
                                 (python . t)
                                 (emacs-lisp . t)))

(org-babel-do-load-languages 'org-babel-load-languages '((shell . t)
                                                         (python . t)
                                                         (plantuml . t)
                                                         (verb . t)))

(setq org-babel-python-command "/opt/homebrew/bin/uv run python")

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

(defun j2/org-open-linear-link ()
  (interactive)
  (if-let ((ll (org-entry-get (point) "LINEAR_LINK")))
      (browse-url ll)))

(provide 'init-org)
;;; init-org.el ends here
