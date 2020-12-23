;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode 1)
  :custom
  (projectile-sort-order 'recentf))

(use-package projectile-ripgrep
  :requires projectile
  :ensure t)

(use-package helm-projectile
  :requires helm
  :ensure t
  :defer 1
  :config
  (helm-projectile-on))

(use-package treemacs-projectile
  :requires treemacs
  :ensure t
  :defer t)

(provide 'init-projectile)
;;; init-projectile.el ends here
