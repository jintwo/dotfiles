;;; elixir-config.el --- elixir config
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode ("\\.ex\\'" "\\.exs\\'"))

(when (featurep 'init-eglot)
  (add-hook 'elixir-home-hook #'eglot-ensure))

(provide 'elixir-config)
;;; elixir-config.el ends here
