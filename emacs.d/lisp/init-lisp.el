;;; init-lisp.el --- lisp modes config
;;; Commentary:
;;; Code:
(use-package cider
  :defer t
  :config
  (setq nrepl-log-messages t
        cider-repl-use-clojure-font-lock t
        cider-eval-result-prefix ";; => ")
  :custom
  (cider-lein-command "/usr/local/bin/lein"))

(use-package sly
  :defer t
  :custom
  (inferior-lisp-program "sbcl"))

(use-package sly-asdf
  :after sly)

(use-package sly-quicklisp
  :after sly)

(use-package helm-sly
  :after sly)

;; (use-package slime
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq-default inferior-lisp-program "sbcl"
;;                 slime-net-coding-system 'utf-8-unix
;;                 slime-protocol-version 'ignore)
;;   (slime-setup '(slime-repl)))

(use-package geiser
  :defer t)

;; (use-package racket-mode
;;   :ensure t
;;   :defer t)

(provide 'init-lisp)
;;; init-lisp.el ends here
