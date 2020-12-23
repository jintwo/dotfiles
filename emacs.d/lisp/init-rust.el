;;; init-rust.el --- Rust dev config
;;; Commentary:
;;; Code:

;; (use-package rust-mode
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq rust-format-on-save t))

(use-package rustic
  :ensure t
  :defer t
  :config
  (setq rustic-format-trigger 'on-save))

(when (featurep 'init-lsp)
  (add-hook 'rust-mode-hook #'lsp))

(provide 'init-rust)
;;; init-rust.el ends here
