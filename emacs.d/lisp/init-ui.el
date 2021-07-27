;;; init-ui.el --- ui config
;;; Commentary:
;;; Code:
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode -1))

(toggle-scroll-bar -1)

(menu-bar-mode -1)

(blink-cursor-mode 0)

(setq mouse-autoselect-window t)

(let ((no-border '(internal-border-width . 0)))
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'initial-frame-alist no-border))

;; (setq line-spacing 0.15) ;; non-retina
(setq line-spacing 0.1) ;; retina
(set-fringe-mode 10)

(set-language-environment "UTF-8")

(defun j2/next-font-weight (weight)
  "Get next font WEIGHT."
  (let* ((weights (mapcar #'(lambda (x) (aref x 1)) font-weight-table))
         (max-idx (- (length weights) 1))
         (weight-idx (seq-position weights weight)))
    (if (and (numberp weight-idx)
             (< weight-idx max-idx))
        (seq-elt weights (1+ weight-idx))
      'normal)))

(defun j2/set-font (family height &optional weight)
  "Set font FAMILY with given HEIGHT and WEIGHT."
  (interactive)
  (unless weight (setq weight 'light))
  (set-face-attribute 'default nil :family family :height height :weight weight :width 'normal)
  ;; strings + docs should be bold
  (set-face-attribute 'font-lock-string-face nil :weight (j2/next-font-weight weight))
  (set-face-attribute 'font-lock-doc-face nil :weight (j2/next-font-weight weight))
  (set-fontset-font "fontset-default" 'unicode-bmp family))

(defun init-ui ()
  "UI settings."
  (interactive)
  ;; (j2/set-font "Cascadia Code PL" 120 'ultra-light)
  ;; (j2/set-font "PT Mono" 120 'light)
  ;; (j2/set-font "Iosevka" 140) ;; non-retina
  (j2/set-font "Iosevka" 120 'light) ;; retina
  ;; (j2/set-font "Source Code Pro" 120 'light)
  ;; (j2/set-font "Roboto Mono" 120 'light)
  (when (eq (window-system) 'mac)
    (toggle-frame-fullscreen)))

(add-hook 'after-init-hook 'init-ui)

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

;; (setq nano-theme-light/dark 'light)
;; (load-theme 'nano t)

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

(use-package helpful
  :defer t
  :bind (:map global-map (("C-h f" . helpful-callable)
                          ("C-h v" . helpful-variable)
                          ("C-h k" . helpful-key)
                          ("C-h d" . helpful-at-point)
                          ("C-h F" . helpful-function)
                          ("C-h C" . helpful-command))))

(provide 'init-ui)
;;; init-ui.el ends here
