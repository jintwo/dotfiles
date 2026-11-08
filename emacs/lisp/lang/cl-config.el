;;; cl-config.el --- CL config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package sly
  :defer t
  ;; :custom
  ;; (inferior-lisp-program "ros -Q dynamic-space-size=4096 run")
  ;; (inferior-lisp-program "ccl64")
  ;; (inferior-lisp-program "abcl")
  :config
  (sly-setup)
  (sly-symbol-completion-mode -1)
  (setq sly-lisp-implementations
        '((sbcl ("sbcl") :coding-system utf-8-unix)
          (ros ("ros" "-Q" "dynamic-space-size=4096" "run") :coding-system utf-8-unix)
          (qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix))))

(provide 'cl-config)
;;; cl-config.el ends here
