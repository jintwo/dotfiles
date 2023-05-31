;;; go-config.el --- go config
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode ("\\.go\\'")
  :init
  (add-hook 'go-mode-hook #'j2/project-eglot-ensure)
  (add-hook 'go-ts-mode-hook #'j2/project-eglot-ensure)
  :config
  (setenv "GOPATH" (expand-file-name "~/Documents/dev/golang/go")))

(provide 'go-config)
;;; go-config.el ends here
