;;; init-rust.el --- Rust dev config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :ensure t
  :defer t
  :config
  (setq rust-format-on-save t))

(when (featurep 'init-lsp)
  (add-hook 'rust-mode-hook #'lsp))

(provide 'init-rust)
;;; init-rust.el ends here
