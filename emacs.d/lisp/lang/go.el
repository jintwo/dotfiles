;;; go.el --- go config
;;; Commentary:
;;; Code:
(use-package go-mode
  :mode ("\\.go\\'"))

(when (featurep 'init-lsp)
  (defun lsp-go-install-save-hooks ()
    ;; (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t))
  (progn
    (add-hook 'go-mode-hook #'lsp-deferred)
    (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)))

(when (featurep 'init-eglot)
  (add-hook 'go-mode-hook #'eglot-ensure))

(provide 'lang/go)
;;; go.el ends here
