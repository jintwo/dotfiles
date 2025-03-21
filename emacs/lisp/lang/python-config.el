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
  :mode (rx ".hy" eos))

(use-package python-black
  :defer t)

(add-to-list 'auto-mode-alist `(,(rx ".jinja2" eos) . prog-mode))

(setq python-shell-interpreter "uv"
      python-shell-interpreter-args "run python -i"
      ;; python-shell-interpreter "ipython"
      ;; python-shell-interpreter-args "--simple-prompt"
      python-shell-prompt-detect-failure-warning nil
      ;; python-shell-completion-native-disabled-interpreters '("ipython" "python3" "python")
      python-shell-completion-native-enable nil
      python-indent-offset 4)

(use-package flymake-ruff
  :hook ((python-mode python-ts-mode) . flymake-ruff-load))

(use-package flymake-mypy
  :load-path "./"
  :hook ((python-mode python-ts-mode) . flymake-mypy-load))

(provide 'python-config)
;;; python-config.el ends here
