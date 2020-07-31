;;; init-helm.el --- helm config
;;; Commentary:
;;; Code:
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-mini)
         ("C-x C-r" . helm-recentf)
         ("M-y" . helm-show-kill-ring))
  :custom
  (helm-command-prefix-key "C-c h"))

(provide 'init-helm)
;;; init-helm.el ends here
