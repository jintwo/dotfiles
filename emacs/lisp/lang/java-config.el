;;; java-config.el --- java config
;;; Commentary:
;;; Code:
(add-hook 'java-mode-hook #'j2/project-eglot-ensure)
(add-hook 'java-ts-mode-hook #'j2/project-eglot-ensure)

(provide 'java-config)
;;; java-config.el ends here
