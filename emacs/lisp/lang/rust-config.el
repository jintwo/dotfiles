;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :init
  (add-hook 'rust-mode-hook #'j2/project-eglot-ensure)
  (add-hook 'rust-ts-mode-hook #'j2/project-eglot-ensure)
  :custom
  (rust-format-on-save t))

(provide 'rust-config)
;;; rust-config.el ends here
