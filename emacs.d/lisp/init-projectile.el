;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(use-package projectile
  :bind-keymap ("s-p" . projectile-command-map)
  :config
  (projectile-mode 1)
  :custom
  (projectile-sort-order 'recently-active)
  (projectile-switch-project-action 'magit-status))

(use-package helm-projectile
  :after projectile
  :init
  (helm-projectile-on))

(use-package treemacs-projectile
  :after projectile
  :requires treemacs)

;; disable project.el (maybe i will switch to it later)
(global-unset-key (kbd "C-x p"))

(provide 'init-projectile)
;;; init-projectile.el ends here
