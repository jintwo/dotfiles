;;; init-beam.el --- BEAM languages dev config
;;; Commentary:
;;; Code:
(use-package erlang
  :mode ("\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'"))

(use-package elixir-mode
  :mode ("\\.ex\\'" "\\.exs\\'"))

(when (featurep 'init-lsp)
  (add-hook 'elixir-mode-hook #'lsp-deferred))

(when (featurep 'init-eglot)
  (add-hook 'elixir-mode-hook #'eglot-ensure))

(provide 'init-beam)
;;; init-beam.el ends here
