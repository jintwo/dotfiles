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

(setq cider-repl-use-clojure-font-lock t
      cider-interactive-eval-result-prefix ";; => ")

(add-hook 'clojure-mode-hook (lambda ()
                               (cider-mode)
                               (local-set-key
                                (kbd "C-c p")
                                'slime-eval-print-last-expression)))
(add-hook 'cider-repl-mode-hook 'company-mode)
(add-hook 'cider-mode-hook 'company-mode)

(provide 'init-lisp)
;;; init-lisp.el ends here
