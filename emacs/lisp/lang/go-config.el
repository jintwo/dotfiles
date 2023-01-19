;;; go-config.el --- go config
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode ("\\.go\\'")
  :config
  (setenv "GOPATH" (expand-file-name "~/Documents/dev/golang/go")))

(when (featurep 'tree-sitter-hl)
  (add-hook 'go-mode-hook #'tree-sitter-hl-mode))

(when (featurep 'init-eglot)
  (add-hook 'go-mode-hook #'eglot-ensure))

(provide 'go-config)
;;; go-config.el ends here
