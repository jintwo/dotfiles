;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :hook ((rust-mode rust-ts-mode) . j2/project-eglot-ensure)
  :custom (rust-format-on-save t))

(provide 'rust-config)
;;; rust-config.el ends here
