;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :hook ((rust-mode-hook rust-ts-mode-hook) . j2/project-eglot-ensure)
  :custom (rust-format-on-save t))

(provide 'rust-config)
;;; rust-config.el ends here
