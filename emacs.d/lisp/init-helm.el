;;; init-helm.el --- helm config
;;; Commentary:
;;; Code:
(jin/require-package 'helm)
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-file-cache-fuzzy-match t)

;; recentf
(recentf-mode 1)
(setq recentf-max-menu-items 50)
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; helm-projectile
(jin/require-package 'helm-projectile)
(helm-projectile-on)

(provide 'init-helm)
;;; init-helm.el ends here
