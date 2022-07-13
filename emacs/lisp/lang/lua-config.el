;;; lua-config.el --- lua config
;;; Commentary:
;;; Code:
(use-package lua-mode
  :mode ("\\.lua\\'")
  :config
  (setq lua-indent-level 4))

(use-package fennel-mode
  :mode ("\\.fnl\\'"))

(provide 'lua-config)
;;; lua-config.el ends here
