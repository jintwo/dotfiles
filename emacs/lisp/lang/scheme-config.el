;;; scheme-config.el --- scheme config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package geiser
  :defer t)

(use-package geiser-guile
  :after geiser
  :defer t)

(use-package geiser-racket
  :after geiser
  :defer t)

(use-package geiser-overlay
  :after geiser)

(when (featurep 'geiser)
  (defun geiser-repl-switch-to-current-module ()
    "Switch to running Geiser REPL and try to enter a module associated with current buffer."
    (interactive)
    (geiser-repl-switch-to-module (buffer-file-name))))

;; ????
;; (use-package racket-mode
;;   :defer t
;;   :init (require 'racket-xp)
;;   :hook (racket-mode . racket-xp-mode))

(use-package sicp
  :defer t)

(provide 'scheme-config)
;;; scheme-config.el ends here
