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
  (add-hook 'python-mode-hook #'lsp-deferred))

(provide 'init-python)
;;; init-python.el ends here
