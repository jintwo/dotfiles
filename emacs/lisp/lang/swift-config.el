;;; swift-config.el --- swift config
;;; Commentary:
;;; Code:
(use-package swift-mode
  :defer t)

(when (featurep 'init-eglot)
  (add-hook 'swift-mode-hook #'eglot-ensure))

(provide 'swift-config)
;;; swift-config.el ends here
