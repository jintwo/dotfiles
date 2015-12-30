;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(jin/require-package 'projectile 'grizzl)

(require 'projectile)
(setq projectile-completion-system 'grizzl)

(projectile-global-mode)

(provide 'init-projectile)
;;; init-projectile.el ends here
