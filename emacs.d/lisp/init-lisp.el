;;; init-lisp.el --- lisp modes config
;;; Commentary:
;;; Code:
;; cl
(jin/require-package 'slime)

(setq-default
 inferior-lisp-program "sbcl"
 slime-net-coding-system 'utf-8-unix
 slime-protocol-version 'ignore)

(slime-setup '(slime-repl))

;; clojure
(jin/require-package 'clojure-mode 'cider)

(require 'cider)
(setq cider-repl-use-clojure-font-lock t
      cider-eval-result-prefix ";; => ")

(add-hook 'clojure-mode-hook (lambda ()
                               (cider-mode)
                               (local-set-key
                                (kbd "C-c p")
                                'slime-eval-print-last-expression)))
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

;; racket
(jin/require-package 'racket-mode)

(require 'racket-mode)
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-c M-j") 'racket-run)))

(provide 'init-lisp)
;;; init-lisp.el ends here
