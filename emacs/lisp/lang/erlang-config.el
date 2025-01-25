;;; erlang-config.el --- erlang config
;;; Commentary:
;;; Code:
(use-package erlang
  :mode (rx ".(erl|hrl|rebar.config)" eos))

(provide 'erlang-config)
;;; erlang-config.el ends here
