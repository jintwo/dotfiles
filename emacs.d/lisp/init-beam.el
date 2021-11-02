;;; init-beam.el --- BEAM languages dev config
;;; Commentary:
;;; Code:
(use-package erlang
  :mode ("\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'"))

(use-package elixir-mode
  :mode ("\\.ex\\'" "\\.exs\\'"))

(add-hook 'elixir-mode-hook #'lsp-deferred)

(provide 'init-beam)
;;; init-beam.el ends here
