;;; init-beam.el --- BEAM languages dev config
;;; Commentary:
;;; Code:
(use-package erlang
  :ensure t
  :defer t
  :mode ("\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'"))

(use-package elixir-mode
  :ensure t
  :defer t
  :mode ("\\.ex\\'" "\\.exs\\'"))

(provide 'init-beam)
;;; init-beam.el ends here
