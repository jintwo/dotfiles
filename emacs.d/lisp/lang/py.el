;;; py.el --- python config
;;; Commentary:
;;; Code:
(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package ein
  :defer t)

(when (featurep 'init-lsp)
  (use-package lsp-pyright
    :config
    (add-hook 'python-mode-hook #'lsp-deferred)))

(when (featurep 'init-eglot)
  (add-hook 'python-mode-hook #'eglot-ensure))

(provide 'lang/py)
;;; py.el ends here
