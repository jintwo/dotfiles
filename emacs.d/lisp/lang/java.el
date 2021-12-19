;;; java.el --- java config
;;; Commentary:
;;; Code:
(when (featurep 'init-lsp)
  (use-package lsp-java
    :defer t
    :config
    (add-hook 'java-mode-hook #'lsp-deferred)))

(when (featurep 'init-eglot)
  (add-hook 'java-mode-hook #'eglot-ensure))

(provide 'lang/java)
;;; java.el ends here
