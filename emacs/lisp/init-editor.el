;;; init-editor --- editor config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package vundo
  :ensure t
  :bind ("C-x u" . vundo)
  :custom
  (vundo-roll-back-on-quit nil)
  (vundo--window-max-height 10))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package iedit
  :ensure t)

(use-package wgrep
  :ensure t)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy
  :defer t
  :bind ("s-l" . avy-goto-line)
  :config
  (avy-setup-default))

(use-package highlight-indent-guides
  :hook ((prog-mode conf-mode yaml-mode) . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-odd-face-perc 45
        highlight-indent-guides-auto-even-face-perc 45
        highlight-indent-guides-auto-character-face-perc 60))

(use-package idle-highlight-mode
  :hook (prog-mode . idle-highlight-mode))

(use-package whole-line-or-region
  :config
  (whole-line-or-region-global-mode t))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; annotate todos
(global-hi-lock-mode t)
(setq to-highlight '(".*TODO.*" ".*FIXME.*"))

(defun j2/annotate-todos ()
  "Annotate TODOs in 'prog-mode' buffer."
  (interactive)
  (dolist (text to-highlight)
    (hi-lock-line-face-buffer text)))

(add-hook 'prog-mode-hook #'j2/annotate-todos)

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package move-dup
  :defer t
  :hook (prog-mode . move-dup-mode))

(electric-indent-mode +1)

;; (setq-default truncate-lines t)
(global-visual-line-mode t)

(when (executable-find "rg")
  (setq grep-program "rg"))

(when (executable-find "fd")
  (setq find-program "fd"))

;; recentf
(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq-default recentf-max-saved-items 1000
                recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'"))
                recentf-max-menu-items 50))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; paren
(show-paren-mode t)
(setq show-paren-delay 0)
(add-hook 'prog-mode-hook
          (lambda ()
            (set-face-attribute 'show-paren-match nil :inverse-video t)))

;; line numbers
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t)))

;; replace current selection with anything
(delete-selection-mode t)

;; custom (TODO: move to init-prog.el)
(defun j2/current-location ()  ;; stolen from http://mbork.pl/2022-06-20_Copying_the_current_location
  "Show the current location and put it into the kill ring.
Use the filename relative to the current VC root directory."
  (interactive)
  (let* ((file-name (file-relative-name buffer-file-name (vc-root-dir)))
	 (line-number (line-number-at-pos nil t))
	 (location (format "%s:%s" file-name line-number)))
    (kill-new location)
    (message location)))

(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default))

(use-package tempo
  :config
  (setq tempo-interactive t))

(setq compilation-scroll-output t)

(provide 'init-editor)
;;; init-editor.el ends here
