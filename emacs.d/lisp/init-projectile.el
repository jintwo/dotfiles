;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'grizzl)
  :bind (("C-c p p" . projectile-switch-project-action))
  :config
  (use-package grizzl
    :after projectile)
  (projectile-mode))

(provide 'init-projectile)
;;; init-projectile.el ends here
