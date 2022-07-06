;;; java-config.el --- java config
;;; Commentary:
;;; Code:
(when (featurep 'init-eglot)
  (add-hook 'java-mode-hook #'eglot-ensure))

(provide 'java-config)
;;; java-config.el ends here
