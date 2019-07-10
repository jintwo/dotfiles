;;; init-lisp.el --- lisp modes config
;;; Commentary:
;;; Code:
;; elisp mode
(define-key emacs-lisp-mode-map (kbd "C-c .") 'find-function-at-point)

;; (define-key cider-mode-map (kbd "C-c .") 'cider-find-var)

;; common
(use-package parinfer :ensure t)
(use-package paren-face :ensure t)

;; cl
(use-package slime
  :ensure t
  :bind-keymap ("C-c p" . slime-eval-print-last-expression)
  :config
  (setq-default inferior-lisp-program "sbcl"
                slime-net-coding-system 'utf-8-unix
                slime-protocol-version 'ignore)
  (slime-setup '(slime-repl)))

;; clojure
(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook #'parinfer-mode)
  (add-hook 'clojure-mode-hook #'paren-face-mode))

(use-package cider
  :ensure t
  :bind (:map clojure-mode-map
              (("C-c ." . cider-find-var)
               ("C-c ," . pop-tag-mark)))
  :config
  (setq nrepl-log-messages t
        cider-repl-use-clojure-font-lock t
        cider-eval-result-prefix ";; => "))

;; racket
(use-package racket-mode
  :ensure t
  :bind-keymap ("C-c M-j" . racket-run))

(use-package geiser
  :ensure t)

(provide 'init-lisp)
;;; init-lisp.el ends here
