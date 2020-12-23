;;; init-gui.el --- gui config
;;; Commentary:
;;; Code:
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode -1))

(toggle-scroll-bar -1)

(menu-bar-mode -1)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

;; (setq line-spacing 0.15) ;; non-retina
(setq line-spacing 0.1) ;; retina

(set-language-environment "UTF-8")

(defun jin/set-font (family height)
  "Set font FAMILY with HEIGHT."
  (interactive)
  (set-face-attribute 'default nil
                      :family family
                      :height height
                      :weight 'light
                      :width 'normal)
  ;; fixes for :bold characters
  (set-face-attribute 'font-lock-string-face nil
                      :weight 'semi-light)
  (set-face-attribute 'font-lock-doc-face nil
                      :weight 'semi-light)
  (set-fontset-font "fontset-default" 'unicode-bmp family))

(defun init-gui ()
  "GUI settings."
  (interactive)
  ;; (jin/set-font "Cascadia Code PL" 120)
  ;; (jin/set-font "SF Mono" 120)
  ;; (jin/set-font "Iosevka" 140) ;; non-retina
  (jin/set-font "Iosevka" 120) ;; retina
  ;; (jin/set-font "Source Code Pro" 120)
  ;; (jin/set-font "Roboto Mono Light for Powerline" 120)
  (when (eq (window-system) 'mac)
    (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'init-gui)

(global-hl-line-mode t)

;; mode-line
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 20
        doom-modeline-bar-width 3
        doom-modeline-icon nil
        doom-modeline-minor-modes nil
        doom-modeline-checker-simple-format t
        doom-modeline-vcs-max-length 30
        doom-modeline-lsp nil
        doom-modeline-env-enable-python t
        doom-modeline-env-enable-rust t
        doom-modeline-env-enable-elixir t))

;; theme

(use-package colorless-themes
  :ensure t)

(use-package nordless-theme
  :ensure t)
;;   :config
;;   (load-theme 'nordless t))

(use-package kaolin-themes
  :ensure t)
;;   :config
;;   (load-theme 'kaolin-mono-light t))

(use-package kaoless-theme
  :load-path "lisp/themes/")

(use-package circadian
  :ensure t
  :config
  ;; Jakarta
  (setq calendar-latitude -6.76665)
  (setq calendar-longitude 108.305928)
  ;; Belgorod
  ;; (setq calendar-latitude 50.596722)
  ;; (setq calendar-longitude 36.587780)
  (setq circadian-themes '((:sunrise . kaoless)
                           (:sunset  . nordless)))
  (circadian-setup))

(use-package treemacs
  :ensure t
  :defer t
  :bind (:map global-map ("M-0" . treemacs-select-window))
  :config
  (progn
    (setq treemacs-no-png-images t)
    (treemacs-load-theme "Iconless")
    (treemacs-resize-icons 11)))

;; windows
(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package resize-window
  :ensure t
  :config
  (when (fboundp 'key-chord-mode)
    (key-chord-define-global "rw" 'resize-window)))

(provide 'init-gui)
;;; init-gui.el ends here
