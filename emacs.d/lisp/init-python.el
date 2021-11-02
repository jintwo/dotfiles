;;; init-python.el --- Python dev config
;;; Commentary:
;;; Code:
(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package ein
  :defer t)

(use-package lsp-pyright
  :config
  (add-hook 'python-mode-hook #'lsp-deferred))

(provide 'init-python)
;;; init-python.el ends here
