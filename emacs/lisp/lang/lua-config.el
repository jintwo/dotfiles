;;; lua-config.el --- lua config
;;; Commentary:
;;; Code:
(use-package lua-mode
  :mode (rx ".lua" eos)
  :custom
  (lua-indent-level 4))

(use-package fennel-mode
  :mode (rx ".fnl" eos))

(provide 'lua-config)
;;; lua-config.el ends here
