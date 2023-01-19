;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :config
  (setq rust-format-on-save t))

(when (featurep 'tree-sitter-hl)
  (add-hook 'rust-mode-hook #'tree-sitter-hl-mode))

(when (featurep 'init-eglot)
  (add-hook 'rust-mode-hook #'eglot-ensure))

(provide 'rust-config)
;;; rust-config.el ends here
