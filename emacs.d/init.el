;;; init.el --- simple config
;;; Commentary:
;;; Code:

(load-library "url-handlers")

(package-initialize)

(defconst user-lib-path (expand-file-name "lisp" user-emacs-directory))
(defconst vendor-lib-path (expand-file-name "vendor" user-emacs-directory))
(defconst custom-themes-path (expand-file-name "themes" user-emacs-directory))

(add-to-list 'load-path user-lib-path)
(add-to-list 'custom-theme-load-path custom-themes-path)
;; (add-to-list 'load-path vendor-lib-path)

(defun is-valid-dir-p (path)
  "Check is PATH valid directory name."
  (not (or (string= path ".") (string= path ".."))))

;; load vendor modules
;; (require 'dash)
;(let* ((contents (directory-files vendor-lib-path))
       ;(vendor-modules (-filter 'is-valid-dir-p contents)))
  ;(-each vendor-modules (lambda (mod-name) (add-to-list 'load-path (format "%s/%s" vendor-lib-path mod-name)))))

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

(setq
 exec-path (append '("/bin" "/sbin" "/usr/sbin" "/usr/bin" "/usr/local/bin" "/usr/local/sbin" "~/bin/"))
 backup-directory-alist `(("." . "~/.emacs.d/saves"))
 initial-frame-alist '((top . 0) (left . 0) (width . 140) (height . 40)))

(setq-default
 truncate-lines 1
 ffap-machine-p-known 'reject)

;; disable transparency
;; (set-frame-parameter (selected-frame) 'alpha '(100 85))
;; (add-to-list 'default-frame-alist '(alpha 100 85))

;; base
(require 'init-base)
(require 'init-themes)
(require 'init-gui)

;; utils
(require 'init-projectile)
(require 'init-helm)
(require 'init-utils)
(require 'init-ibuffer)
(require 'init-evil)
(require 'init-org)

;; dev
(require 'init-company)
(require 'init-vc)
(require 'init-flycheck)
(require 'init-sp)
(require 'init-markup)
(require 'init-python)
(require 'init-lisp)
(require 'init-haskell)
(require 'init-lua)
(require 'init-lang)

;; private
(when (file-exists-p (format "%s/init-private.el" user-lib-path))
  (require 'init-private))

;; projectile helper
(defun proj-mode-line ()
  "Get projectile mode-line for current project."
  (cond ((file-remote-p default-directory) " projectile")
        (pyvenv-virtual-env-name (format " proj[%s/py:%s]" (projectile-project-name) pyvenv-virtual-env-name))
        (t (format " proj[%s]" (projectile-project-name)))))

;; vars
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#424242"))
 '(cider-lein-command "/usr/local/bin/lein")
 '(custom-safe-themes
   (quote
    ("a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "49b36c626548d200f97144cedb44f0a48020fda221b9e2930dc7d95ef4013eb1" "e5d0ae725917de5ec0839bd89dca9dff92e0c8fb6f7432dd338e8b4d893a6d93" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-rpc-python-command "python")
 '(fci-rule-color "#424242")
 '(js-indent-level 2)
 '(magit-use-overlays nil)
 '(markdown-css-paths
   (quote
    ("http://jasonm23.github.io/markdown-css-themes/markdown.css")))
 '(neo-theme (quote ascii))
 '(package-selected-packages
   (quote
    (neotree popup-imenu ujelly-theme material-theme use-package expand-region powerline js2-mode racket-mode python-mode markdown-mode smartparens gitconfig-mode helm-projectile json-mode evil-vimish-fold restclient gitignore-mode dash-at-point zenburn-theme yaml-mode web-mode unicode-whitespace tabulated-list swift-mode sublime-themes subatomic-theme soothe-theme slime-company rich-minority resize-window rainbow-delimiters protobuf-mode pcre2el pastelmac-theme paradox obsidian-theme noctilux-theme naquadah-theme multiple-cursors monokai-theme lua-mode json-reformat jinja2-mode idomenu ibuffer-vc ht helm-ag gruber-darker-theme grizzl graphviz-dot-mode gist flatui-theme flatland-theme exec-path-from-shell evil-surround evil-nerd-commenter evil-magit evil-leader elpy edts dockerfile-mode direx company-irony company-ghc color-theme-sanityinc-solarized cmake-mode cider ample-theme alchemist ag afternoon-theme)))
 '(paradox-github-token t)
 '(projectile-mode-line (quote (:eval (proj-mode-line))))
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (encoding . utf-8)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(solarized-use-less-bold t)
 '(subatomic-high-contrast nil)
 '(swift-indent-offset 2)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil)
 '(whitespace-style
   (quote
    (face trailing tabs spaces lines-tail newline empty indentation space-after-tab::tab space-before-tab::tab space-mark tab-mark))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; init.el ends here
