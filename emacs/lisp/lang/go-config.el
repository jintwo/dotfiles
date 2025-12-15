;;; go-config.el --- go config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode (rx ".go" eos)
  :hook (((go-mode go-ts-mode) . j2/project-eglot-ensure)
         ((go-mode go-ts-mode) . j2/go-mode-hook))
  :config (setenv "GOPATH" (expand-file-name "~/Documents/dev/golang/go")))

(defvar go-tab-width 4)

(defun j2/go-mode-hook ()
  (setq tab-width go-tab-width
        go-ts-mode-indent-offset go-tab-width))

(provide 'go-config)
;;; go-config.el ends here
