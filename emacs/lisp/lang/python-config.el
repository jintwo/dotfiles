;;; python-config.el --- python config
;;; Commentary:
;;; Code:
(use-package python
  :hook ((python-mode python-ts-mode) . j2/project-eglot-ensure))

(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package python-mls
  :hook (inferior-python-mode . python-mls-mode))

(use-package jupyter
  :defer t)

(use-package hy-mode
  :mode ("\\.hy\\'"))

(use-package python-black
  :defer t)

(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . prog-mode))

(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i"
      ;; python-shell-interpreter "ipython"
      ;; python-shell-interpreter-args "--simple-prompt"
      python-shell-prompt-detect-failure-warning nil
      ;; python-shell-completion-native-disabled-interpreters '("ipython" "python3" "python")
      python-shell-completion-native-enable nil
      python-indent-offset 4)

(use-package flymake-ruff
  :hook ((python-mode python-ts-mode) . flymake-ruff-load))

(require 'flymake-mypy)
(add-hook 'python-mode-hook #'flymake-mypy-load)
(add-hook 'python-ts-mode-hook #'flymake-mypy-load)

(provide 'python-config)
;;; python-config.el ends here
