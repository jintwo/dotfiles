;;; gleam-config.el --- gleam config
;;; Commentary:
;;; Code:
(use-package tree-sitter
  :defer t)

(use-package tree-sitter-indent
  :defer t)

(use-package gleam-mode
  :after (tree-sitter tree-sitter-indent)
  :load-path "~/.emacs.d/vendor/gleam-mode"
  :mode ("\\.gleam\\'"))

(provide 'gleam-config)
;;; gleam-config.el ends here
