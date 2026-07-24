;;; lua-config.el --- lua config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; INFO: emacs31 already included lua-mode

(use-package fennel-mode
  :mode (rx ".fnl" eos))

(provide 'lua-config)
;;; lua-config.el ends here
