;;; init.el --- simple config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;;; maybe load site-lisp packages
;; (let ((vendor-dir-path (expand-file-name "vendor" user-emacs-directory)))
;;   (when (file-directory-p vendor-dir-path)
;;     (add-to-list 'load-path vendor-dir-path)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq gc-cons-threshold 100000000)

(setq read-process-output-max (* 1024 1024))

(load-library "url-handlers")

(set-language-environment "UTF-8")
(setenv "ESHELL" (expand-file-name "~/bin/eshell"))
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq exec-path (append '("/bin" "/sbin" "/usr/sbin" "/usr/bin" "/usr/local/bin" "/usr/local/sbin" "~/bin/"))
      backup-directory-alist `(("." . "~/.emacs.d/saves")))

(defalias 'yes-or-no-p 'y-or-n-p)

;; profiling
(defun display-startup-time ()
  "Display Emacs startup time."
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)
;;

;; base
(require 'init-packages)

;;---
;; (setq user-emacs-directory "~/.cache/emacs")
(use-package no-littering)

;;---

(require 'init-keys)

;; custom themes
(require 'kaoless-theme)

;; maybe join gui+editor
(require 'init-gui)
(require 'init-helm)
;; TODO: should try `selectrum' instead of `helm' or `ivy'
;; ivy looks nice, but before should setup ivy helm counterparts
;; feature flags?
;; (require 'init-ivy)
(require 'init-editor)
(require 'init-ibuffer)
(require 'init-utils)
(require 'init-org)

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
