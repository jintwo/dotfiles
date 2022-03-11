;;; init.el --- simple config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)
(when (package-installed-p 'gcmh)
  (gcmh-mode 1))

;;; maybe load site-lisp packages
(let ((vendor-dir-path (expand-file-name "vendor" user-emacs-directory)))
  (when (file-directory-p vendor-dir-path)
    (add-to-list 'load-path vendor-dir-path)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(setq read-process-output-max (* 1024 1024))

(set-language-environment "UTF-8")
(setenv "ESHELL" (expand-file-name "/usr/local/bin/fish"))
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

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

;; maybe join ui+editor
(require 'init-ui)
(require 'init-vertico)
(require 'init-consult)
(require 'init-embark)

(require 'init-editor)
(require 'init-ibuffer)
(require 'init-utils)
(require 'init-org)

;; dev
;; (require 'init-flycheck)
(require 'init-git)
(require 'init-sp)
;; (require 'init-company)
(require 'init-corfu)

;; (require 'init-lsp)
(require 'init-eglot)

;; langs
(require 'init-lang)

;; utils
(require 'init-hydra)

;; custom packages
(require 'init-vendor)

;; -------
(put 'narrow-to-region 'disabled nil)

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
