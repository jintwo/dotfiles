;;; python-config.el --- python config
;;; Commentary:
;;; Code:
(use-package python
  :hook ((python-mode python-ts-mode) . j2/project-eglot-ensure))

(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package jupyter
  :defer t)

(use-package ein
  :defer t)

(use-package hy-mode
  :mode (rx ".hy" eos))

(use-package python-black
  :defer t)

(add-to-list 'auto-mode-alist `(,(rx ".jinja2" eos) . prog-mode))

(setq python-shell-interpreter "uv"
      python-shell-interpreter-args "run python -i"
      python-shell-prompt-detect-failure-warning nil
      python-indent-offset 4
      python-interpreter "uv"
      python-interpreter-args "run python")

(use-package flymake-ruff
  :hook ((python-mode python-ts-mode) . flymake-ruff-load))

(use-package flymake-mypy
  :load-path "lisp/lang/"
  :hook ((python-mode python-ts-mode) . flymake-mypy-load))

;; (use-package uv-mode)

(provide 'python-config)
;;; python-config.el ends here
