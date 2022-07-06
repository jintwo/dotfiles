;;; cl-config.el --- CL config
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  :custom
  (inferior-lisp-program "sbcl")
  ;; (inferior-lisp-program "ros -Q run")
  :config
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (sly-setup)
  (sly-symbol-completion-mode -1))

(use-package sly-asdf
  :defer t)

(use-package sly-quicklisp
  :defer t)

(use-package sly-repl-ansi-color
  :defer t)

(provide 'cl-config)
;;; cl-config.el ends here
