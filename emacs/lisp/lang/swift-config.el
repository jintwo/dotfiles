;;; swift-config.el --- swift config
;;; Commentary:
;;; Code:
(use-package swift-mode
  :defer t
  :init
  (add-hook 'swift-mode-hook #'j2/project-eglot-ensure))

(provide 'swift-config)
;;; swift-config.el ends here
