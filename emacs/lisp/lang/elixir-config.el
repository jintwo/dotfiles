;;; elixir-config.el --- elixir config
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode ("\\.ex\\'" "\\.exs\\'")
  :hook (elixir-mode-hook . j2/project-eglot-ensure))

(provide 'elixir-config)
;;; elixir-config.el ends here
