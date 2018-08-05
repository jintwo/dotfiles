;;; init-lisp.el --- lisp modes config
;;; Commentary:
;;; Code:
;; elisp mode
(define-key emacs-lisp-mode-map (kbd "C-c .") 'find-function-at-point)

;; common
(use-package parinfer :ensure t)
(use-package paren-face :ensure t)

;; cl
(use-package slime
  :ensure t
  :bind ("C-c p" . slime-eval-print-last-expression)
  :config
  (setq-default inferior-lisp-program "sbcl"
                slime-net-coding-system 'utf-8-unix
                slime-protocol-version 'ignore)
  (slime-setup '(slime-repl)))

;; clojure
(use-package clojure-mode
  :ensure t
  :config
  (use-package cider
    :after (clojure-mode company-mode)
    :config
    (setq cider-repl-use-clojure-font-lock t
          cider-eval-result-prefix ";; => ")
    (add-hook 'cider-repl-mode-hook 'company-mode)
    (add-hook 'cider-mode-hook 'company-mode))

  (defun clojure-mode-init ()
    (cider-mode)
    (parinfer-mode))

  (add-hook 'clojure-mode-hook 'clojure-mode-init))

;; racket
(use-package racket-mode
  :ensure t
  :bind ("C-c M-j" . racket-run))

(provide 'init-lisp)
;;; init-lisp.el ends here
