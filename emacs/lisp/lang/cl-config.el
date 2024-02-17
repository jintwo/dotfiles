;;; cl-config.el --- CL config
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  :custom
  (inferior-lisp-program "sbcl")
  ;; (inferior-lisp-program "ccl64")
  ;; (inferior-lisp-program "ros -Q run")
  :config
  (sly-setup)
  (sly-symbol-completion-mode -1))

(provide 'cl-config)
;;; cl-config.el ends here
