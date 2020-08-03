;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode 1)
  :custom
  (projectile-sort-order 'recentf))

(use-package projectile-ripgrep
  :requires projectile
  :ensure t)

(use-package helm-projectile
  :requires projectile
  :ensure t
  :defer 1
  :config
  (helm-projectile-on))

(provide 'init-projectile)
;;; init-projectile.el ends here
