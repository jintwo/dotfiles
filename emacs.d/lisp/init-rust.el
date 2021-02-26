;;; init-rust.el --- Rust dev config
;;; Commentary:
;;; Code:

;; (use-package rust-mode
;;   :mode ("\\.rs\\'")
;;   :config
;;   (setq rust-format-on-save t))

(use-package rustic
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (setq rustic-format-trigger 'on-save))

(when (featurep 'init-lsp)
  (add-hook 'rust-mode-hook #'lsp-deferred))

(when (featurep 'init-eglot)
  (add-hook 'rust-mode-hook #'eglot-ensure))

(provide 'init-rust)
;;; init-rust.el ends here
