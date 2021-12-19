;;; lua.el --- lua config
;;; Commentary:
;;; Code:
(use-package lua-mode
  :mode ("\\.lua\\'")
  :config
  (setq lua-indent-level 4))

(provide 'lang/lua)
;;; lua.el ends here
