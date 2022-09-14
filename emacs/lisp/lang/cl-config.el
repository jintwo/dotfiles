;;; cl-config.el --- CL config
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  :custom
  ;; (inferior-lisp-program "sbcl")
  (inferior-lisp-program "ccl64")
  ;; (inferior-lisp-program "ros -Q run")
  :config
  (sly-setup)
  (sly-symbol-completion-mode -1))

(use-package sly-asdf
  :after sly
  :defer t)

(use-package sly-quicklisp
  :after sly
  :defer t)

(use-package sly-repl-ansi-color
  :after sly
  :defer t)

(provide 'cl-config)
;;; cl-config.el ends here
