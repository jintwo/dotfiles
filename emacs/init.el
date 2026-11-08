;;; init.el --- simple config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package no-littering)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'package)
(when (package-installed-p 'gcmh)
  (gcmh-mode 1))

;;; maybe load site-lisp packages
(let ((vendor-dir-path (expand-file-name "vendor" user-emacs-directory)))
  (when (file-directory-p vendor-dir-path)
    (add-to-list 'load-path vendor-dir-path)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(set-language-environment "UTF-8")
(setenv "ESHELL" (expand-file-name "/bin/zsh"))
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))

(setopt
 inhibit-startup-screen t                 ; Disable start-up screen
 inhibit-startup-message t                ; Disable startup message
 inhibit-startup-echo-area-message "jin"  ; Disable initial echo message
 initial-scratch-message ""               ; Empty the initial *scratch* buffer
 initial-buffer-choice t                  ; Open *scratch* buffer at init
 read-process-output-max (* 4 1024 1024)
 ffap-machine-p-known 'reject
 load-prefer-newer t
 use-short-answers t
 kill-buffer-delete-auto-save-files t
 calendar-week-start-day 1
 ring-bell-function 'pulse-momentary-highlight-one-line
 ;; native comp
 native-comp-async-report-warnings-errors 'silent
 native-comp-deferred-compilation t)

;; (context-menu-mode 1)

;; profiling
(defun display-startup-time ()
  "Display Emacs startup time."
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                    (time-subtract after-init-time before-init-time)))
           gcs-done))

(add-hook 'emacs-startup-hook #'display-startup-time)

;; base
(require 'init-packages)
(when (eq system-type 'gnu/linux)
  (require 'init-linux))

(setopt
;; Do not saves duplicates in kill-ring
 kill-do-not-save-duplicates t
 ;; Make scrolling less stuttered
 auto-window-vscroll nil
 fast-but-imprecise-scrolling t
 scroll-conservatively 101
 scroll-margin 0
 scroll-preserve-screen-position t)

;; Better support for files with long lines
(setq-default bidi-paragraph-direction 'left-to-right)
(setq-default bidi-inhibit-bpa t)
(global-so-long-mode 1)

;; unset some shortcuts
(keymap-global-unset "C-x C-u")  ;; prefix used by j2 utils

;; maybe join ui+editor
(require 'init-ui)
(require 'init-modeline)
(require 'init-editor)
(require 'init-completion)
(require 'init-ibuffer)
(require 'init-utils)
(require 'init-org)

;; TODO: combine dev+langs

;; dev
(require 'init-git)
(require 'init-sp)
(require 'init-eglot)

;; langs
(require 'init-lang)

;; utils
;; feeds
(require 'init-elfeed)

;; mail
(when (file-exists-p (expand-file-name "lisp/init-mail.el" user-emacs-directory))
  (require 'init-mail))

;; llm
(when (file-exists-p (expand-file-name "lisp/init-llm.el" user-emacs-directory))
  (require 'init-llm))

;; custom packages
(require 'init-vendor)

;; shortcuts
(require 'init-keys)

;; private
(when (file-exists-p (expand-file-name "lisp/init-private.el" user-emacs-directory))
  (require 'init-private))

(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init)
;;; init.el ends here
