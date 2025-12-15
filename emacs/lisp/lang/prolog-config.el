;;; prolog-config.el --- prolog config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . prolog-mode))

(provide 'prolog-config)
;;; prolog-config.el ends here
