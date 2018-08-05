;;; init-helm.el --- helm config
;;; Commentary:
;;; Code:
(use-package helm
  :ensure t
  :defer 0.1
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x C-r" . helm-recentf))
  :config
  (use-package helm-projectile
    :ensure t)
  (use-package helm-ag
    :ensure t)
  (helm-mode 1)
  (helm-projectile-on)
  (recentf-mode 1)
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t
        helm-M-x-fuzzy-match t
        helm-file-cache-fuzzy-match t
        recentf-max-menu-items 50))

(provide 'init-helm)
;;; init-helm.el ends here
