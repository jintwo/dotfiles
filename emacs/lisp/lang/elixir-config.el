;;; elixir-config.el --- elixir config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode (rx ".exs?" eos)
  :hook (elixir-mode . j2/project-eglot-ensure))

(provide 'elixir-config)
;;; elixir-config.el ends here
