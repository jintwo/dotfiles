;;; init-python.el --- Python dev config
;;; Commentary:
;;; Code:
(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package ein
  :defer t)

(when (featurep 'init-lsp)
  (use-package lsp-pyright)
  (add-hook 'python-mode-hook #'lsp-deferred))

(when (featurep 'init-eglot)
  (add-hook 'python-mode-hook #'eglot-ensure))

(provide 'init-python)
;;; init-python.el ends here
