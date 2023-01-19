;;; js-config.el --- js config
;;; Commentary:
;;; Code:
(use-package js2-mode
  :defer t)

(use-package typescript-mode
  :defer t)

(when (featurep 'tree-sitter-hl)
  (add-hook 'typescript-mode-hook #'tree-sitter-hl-mode))

(when (featurep 'init-eglot)
  (add-hook 'typescript-mode-hook #'eglot-ensure))

(provide 'js-config)
;;; js-config.el ends here
