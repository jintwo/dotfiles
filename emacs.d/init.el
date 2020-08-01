;;; init.el --- simple config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; TODO: measure startup time ;)

;;; maybe load site-lisp packages
;; (let ((vendor-dir-path (expand-file-name "vendor" user-emacs-directory)))
;;   (when (file-directory-p vendor-dir-path)
;;     (add-to-list 'load-path vendor-dir-path)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-library "url-handlers")

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq exec-path (append '("/bin" "/sbin" "/usr/sbin" "/usr/bin" "/usr/local/bin" "/usr/local/sbin" "~/bin/"))
      backup-directory-alist `(("." . "~/.emacs.d/saves")))

(defalias 'yes-or-no-p 'y-or-n-p)

;; base
(require 'init-packages)
(require 'init-gui)
(require 'init-keys)
(require 'init-helm)
(require 'init-editor)
(require 'init-ibuffer)
(require 'init-utils)

;; dev
(require 'init-flycheck)
(require 'init-git)
(require 'init-sp)
(require 'init-company)
(require 'init-lsp)

;; langs
(require 'init-lisp)
(require 'init-python)
(require 'init-rust)
(require 'init-beam)
(require 'init-haskell)
(require 'init-ocaml)
(require 'init-lang)

;; utils
(require 'init-hydra)
(require 'init-projectile)

;; custom packages
;; (require 'init-vendor)

(put 'narrow-to-region 'disabled nil)

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
