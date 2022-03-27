;;; cl-config.el --- CL config
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  :custom
  (inferior-lisp-program "ros -Q run")
  :config
  (sly-setup))

(provide 'cl-config)
;;; cl-config.el ends here
