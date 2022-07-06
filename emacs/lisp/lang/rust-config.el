;;; rust-config.el --- rust config
;;; Commentary:
;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'")
  :config
  (setq rust-format-on-save t))

(when (featurep 'init-eglot)
  (add-hook 'rust-mode-hook #'eglot-ensure))

(provide 'rust-config)
;;; rust-config.el ends here
