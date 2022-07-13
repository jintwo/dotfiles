;;; python-config.el --- python config
;;; Commentary:
;;; Code:
(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package ein
  :defer t)

(use-package python-mls
  :config
  (python-mls-setup))

(when (featurep 'init-eglot)
  (add-hook 'python-mode-hook #'eglot-ensure))

(use-package hy-mode
  :mode ("\\.hy\\'"))

(provide 'python-config)
;;; python-config.el ends here
