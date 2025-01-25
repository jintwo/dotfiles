;;; elixir-config.el --- elixir config
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode (rx ".exs?" eos)
  :hook (elixir-mode . j2/project-eglot-ensure))

(provide 'elixir-config)
;;; elixir-config.el ends here
