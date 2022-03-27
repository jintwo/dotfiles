;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :config
  (setq rust-format-on-save t))

;; (use-package rustic
;;   :mode ("\\.rs\\'" . rust-mode)
;;   :config
;;   (setq rustic-format-trigger 'on-save))

(when (featurep 'init-lsp)
  (add-hook 'rust-mode-hook #'lsp-deferred))

(when (featurep 'init-eglot)
  ;; (add-to-list 'eglot-server-programs
  ;;            `(rust-mode . ("rust-analyzer")))
  (add-hook 'rust-mode-hook #'eglot-ensure))

(provide 'rust-config)
;;; rust-config.el ends here
