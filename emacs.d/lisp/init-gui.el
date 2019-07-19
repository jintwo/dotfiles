;;; init-gui.el --- gui config
;;; Commentary:
;;; Code:
(setq ns-use-srgb-colorspace nil)

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      use-file-dialog nil
      use-dialog-box nil)

(setq-default line-spacing 0.1)

(setq ring-bell-function 'ignore)

(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

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

(defun init-font ()
  "Fonts settings."
  (interactive)
  (if (eq system-type 'darwin)
      (jin/set-font "Source Code Pro" 120)
    (jin/set-font "Source Code Pro" 110)))

(defun init-gui ()
  "GUI settings."
  (init-font))

(add-hook 'after-init-hook 'init-gui)

(provide 'init-gui)
;;; init-gui.el ends here
