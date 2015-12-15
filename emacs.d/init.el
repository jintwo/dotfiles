;;; init.el --- simple config
;;; Commentary:
;;; Code:
(defconst user-lib-path (expand-file-name "lisp" user-emacs-directory))

(add-to-list 'load-path user-lib-path)

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

(setq
 exec-path (append exec-path '("~/bin" "/usr/local/bin"))
 backup-directory-alist `(("." . "~/.emacs.d/saves"))
 initial-frame-alist '((top . 0) (left . 0) (width . 140) (height . 40)))

(setq-default
 truncate-lines 1
 ffap-machine-p-known 'reject)

(set-frame-parameter (selected-frame) 'alpha '(93 93))
(add-to-list 'default-frame-alist '(alpha 93 93))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-rpc-python-command "python3")
 '(magit-use-overlays nil)
 '(markdown-css-path
   "http://jasonm23.github.io/markdown-css-themes/markdown.css")
 '(neo-theme (quote ascii))
 '(paradox-github-token t)
 '(projectile-hg-command "/usr/local/bin/hg locate -0 -I .")
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
 '(swift-indent-offset 2))

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
(require 'init-go)
(require 'init-haskell)
(require 'init-scala)
(require 'init-lua)
(require 'init-lang)

;; private
(when (file-exists-p (format "%s/init-private.el" user-lib-path))
  (require 'init-private))

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
