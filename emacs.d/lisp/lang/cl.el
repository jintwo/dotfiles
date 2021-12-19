;;; cl.el --- CL config
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  :custom
  (inferior-lisp-program "ros -Q run")
  :config
  (sly-setup))

(provide 'lang/cl)
;;; cl.el ends here
