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
(set-fringe-mode 10)

(set-language-environment "UTF-8")

(defun j2/set-font (family height)
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
  ;; (j2/set-font "Cascadia Code PL" 120)
  ;; (j2/set-font "SF Mono" 120)
  ;; (j2/set-font "Iosevka" 140) ;; non-retina
  (j2/set-font "Iosevka" 120) ;; retina
  ;; (j2/set-font "Source Code Pro" 120)
  ;; (j2/set-font "Roboto Mono Light for Powerline" 120)
  (when (eq (window-system) 'mac)
    (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'init-gui)

(global-hl-line-mode t)

;; mode-line
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

(use-package doom-modeline
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
(use-package colorless-themes)

(use-package nordless-theme
  ;; :config
  ;; (load-theme 'nordless t)
  )

(use-package kaolin-themes
  ;; :config
  ;; (load-theme 'kaolin-mono-light t)
  )

(use-package circadian
  :defer 0
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
  :defer t
  :bind (:map global-map ("M-0" . treemacs-select-window))
  :config
  (progn
    (setq treemacs-no-png-images t)
    (treemacs-resize-icons 11)))

;; windows
(use-package ace-window
  :defer 1
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package resize-window
  :defer 1
  :config
  (when (fboundp 'key-chord-mode)
    (key-chord-define-global "rw" 'resize-window)))

(provide 'init-gui)
;;; init-gui.el ends here
