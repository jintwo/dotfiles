;;; init-lisp.el --- lisp modes config
;;; Commentary:
;;; Code:
(use-package cider
  :ensure t
  :defer t
  :config
  (setq nrepl-log-messages t
        cider-repl-use-clojure-font-lock t
        cider-eval-result-prefix ";; => ")
  :custom
  (cider-lein-command "/usr/local/bin/lein"))

(use-package sly
  :ensure t
  :defer t
  :config
  (setq-default inferior-lisp-program "sbcl"))

(use-package sly-asdf
  :requires sly
  :ensure t
  :defer t)

(use-package sly-quicklisp
  :requires sly
  :ensure t
  :defer t)

(use-package helm-sly
  :requires helm
  :ensure t
  :defer t)

;; (use-package slime
;;   :ensure t
;;   :defer t
;;   :config
;;   (setq-default inferior-lisp-program "sbcl"
;;                 slime-net-coding-system 'utf-8-unix
;;                 slime-protocol-version 'ignore)
;;   (slime-setup '(slime-repl)))

(use-package geiser
  :ensure t
  :defer t)

;; (use-package racket-mode
;;   :ensure t
;;   :defer t)

(define-key emacs-lisp-mode-map (kbd "C-c .") 'find-function-at-point)

(provide 'init-lisp)
;;; init-lisp.el ends here
