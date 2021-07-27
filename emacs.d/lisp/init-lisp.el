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
  (inferior-lisp-program "ros -Q run")
  :config
  (sly-setup))

(use-package helm-sly
  :after sly)

(use-package geiser
  :defer t)

;; (use-package racket-mode
;;   :ensure t
;;   :defer t)

(provide 'init-lisp)
;;; init-lisp.el ends here
