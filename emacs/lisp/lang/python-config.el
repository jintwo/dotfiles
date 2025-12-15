;;; python-config.el --- python config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(python-ts-mode . ,(eglot-alternatives '(("uv" "run" "pylsp")
                                                         ("uv" "run" "zubanls")
                                                         ("uv" "run" "pyright-langserver" "--stdio"))))))

(use-package python
  :hook ((python-mode python-ts-mode) . j2/project-eglot-ensure))

(use-package jupyter
  :defer t)

(use-package ein
  :defer t)

(use-package hy-mode
  :mode (rx ".hy" eos))

(add-to-list 'auto-mode-alist `(,(rx ".jinja2" eos) . prog-mode))

(setq python-shell-interpreter "uv"
      python-shell-interpreter-args "run python -i"
      python-shell-prompt-detect-failure-warning nil
      python-indent-offset 4
      python-interpreter "uv"
      python-interpreter-args "run python")

(use-package flymake-ruff
  :hook ((python-mode python-ts-mode) . flymake-ruff-load)
  :config
  (setq flymake-ruff-program '("uv" "run" "ruff")))

(use-package flymake-mypy
  :load-path "lisp/lang/"
  :hook ((python-mode python-ts-mode) . flymake-mypy-load)
  :config
  (setq mypy-executable "mypy")
  (setq flymake-mypy-executable "uv")
  (setq flymake-mypy-args '("run" ,mypy-executable "--show-column-numbers" ".")))

(provide 'python-config)
;;; python-config.el ends here
