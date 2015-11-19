;;; init-markup.el --- markup languages modes config
;;; Commentary:
;;; Code:
;; markdown
(jin/require-package 'markdown-mode)

(evil-leader/set-key-for-mode 'markdown-mode
  "s" 'markdown-insert-bold)

(jin/add-auto-mode 'markdown-mode "\\.text\\'" "\\.markdown\\'" "\\.md\\'")
(add-hook 'markdown-mode-hook '(lambda () (setq tab-width 2)))

(provide 'init-markup)
;;; init-markup.el ends here
