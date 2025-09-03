;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :defer 0
  :delight
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package memento-mori
  :defer 1
  :custom
  (memento-mori-birth-date "1987-04-14")
  :config
  (memento-mori-mode t))

;; TODO: add consult-dash + dash-docs

(use-package gcmh
  :delight)

(defun j2/magit-current-project ()
  (interactive)
  (magit-status (project-root (project-current t))))

(use-package activities
  :init
  (activities-mode)
  (activities-tabs-mode)
  ;; Prevent `edebug' default bindings from interfering.
  (setq edebug-inhibit-emacs-lisp-mode-bindings t)

  :bind
  (("C-x C-a C-n" . activities-new)
   ("C-x C-a C-d" . activities-define)
   ("C-x C-a C-a" . activities-resume)
   ("C-x C-a C-s" . activities-suspend)
   ("C-x C-a C-k" . activities-kill)
   ("C-x C-a RET" . activities-switch)
   ("C-x C-a b" . activities-switch-buffer)
   ("C-x C-a g" . activities-revert)
   ("C-x C-a l" . activities-list)))

(defun j2/new-activity-for-current-project ()
  (interactive)
  (let ((project (project-current t)))
    (activities-new (project-name project))
    (dired (project-root project))))

(defun j2/project-override (dir)
  (let ((override (locate-dominating-file dir ".project.el")))
    (if override
        (cons 'vc override)
      nil)))

;; project
(use-package project
  :config
  (add-hook 'project-find-functions #'j2/project-override)
  :custom
  (project-switch-commands '((project-find-file "Find file")
                             (consult-ripgrep "Ripgrep" ?r)
                             (project-dired "Dired")
                             (j2/magit-current-project "Magit" ?m)
                             (eat-project "Eat" ?e)
                             (j2/new-activity-for-current-project "New activity" ?a))))

(use-package reveal-in-folder
  :defer 1)

(use-package dwim-shell-command
  :defer 1)

(use-package transmission
  :defer 1
  :bind (:map global-map (("C-c u t" . transmission))))

(use-package elpher
  :defer 1
  :bind (:map global-map (("C-c u e" . elpher))))

(use-package osc
  :ensure t)

(use-package eat
  :ensure t
  :config
  ;; (setq eat-term-name "eat-mono")
  (setq eat-term-name "xterm-256color")
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)
  ;; allow ace-window
  (require 'eat)
  (push '[?\e ?o] eat-semi-char-non-bound-keys)
  (eat-update-semi-char-mode-map)
  (eat-reload)

  ;; handle dired shell
  (setq eat-message-handler-alist '(("dired" . (lambda (d) (dired d))) ;; open cwd in dired
                                    ("magit" . (lambda (d) (magit-status d nil)))))) ;; open cwd in magit

;; display eat termnal in bottom window
;; TODO: fix following params
;; (add-to-list 'display-buffer-alist
;;              `(,(rx "-eat*")
;;                (display-buffer-reuse-mode-window
;;                 display-buffer-at-bottom
;;                 display-buffer-in-side-window)
;;                (window-height . 0.3)
;;                (side . bottom)))

(use-package ediff
  :ensure nil
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

(setq delete-by-moving-to-trash t)

;; TODO: ebook tools
;; calibredb
;; nov

(use-package buffer-terminator
  :ensure t
  :custom
  (buffer-terminator-verbose nil)
  :config
  (buffer-terminator-mode 1))

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-mode))

(use-package dired
  :ensure nil
  :defer t
  :hook (dired-mode . dired-hide-details-mode)
  :config
  (setq dired-dwim-target t                  ;; do what I mean
        dired-recursive-copies 'always       ;; don't ask when copying directories
        dired-create-destination-dirs 'ask
        dired-clean-confirm-killing-deleted-buffers nil
        dired-make-directory-clickable t
        dired-mouse-drag-files t
        dired-kill-when-opening-new-dired-buffer t)   ;; Tidy up open buffers by default
  (let ((gls (executable-find "gls")))
    (when gls
      (setq dired-use-ls-dired t
            insert-directory-program gls
            dired-listing-switches "-aBhl --group-directories-first"))))

(provide 'init-utils)
;;; init-utils.el ends here
