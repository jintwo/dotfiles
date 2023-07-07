;;; go-config.el --- go config
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode ("\\.go\\'")
  :hook ((go-mode go-ts-mode) . j2/project-eglot-ensure)
  :config (setenv "GOPATH" (expand-file-name "~/Documents/dev/golang/go")))

(provide 'go-config)
;;; go-config.el ends here
