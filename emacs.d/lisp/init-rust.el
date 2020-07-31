;;; init-rust.el --- Rust dev config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :ensure t
  :defer t
  :config
  (setq rust-format-on-save t))

(provide 'init-rust)
;;; init-rust.el ends here
