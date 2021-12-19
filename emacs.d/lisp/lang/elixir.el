;;; elixir.el --- elixir config
;;; Commentary:
;;; Code:
(use-package elixir-mode
  :mode ("\\.ex\\'" "\\.exs\\'"))

(when (featurep 'init-lsp)
  (add-hook 'elixir-mode-hook #'lsp-deferred))

(when (featurep 'init-eglot)
  (add-hook 'elixir-home-hook #'eglot-ensure))

(provide 'lang/elixir)
;;; elixir.el ends here
