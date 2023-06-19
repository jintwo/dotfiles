;;; scheme-config.el --- scheme config
;;; Commentary:
;;; Code:
(use-package geiser
  :defer t)

(use-package geiser-guile
  :defer t)

(use-package racket-mode
  :defer t
  :init (require 'racket-xp)
  :hook (racket-mode-hook . racket-xp-mode))

(provide 'scheme-config)
;;; scheme-config.el ends here
