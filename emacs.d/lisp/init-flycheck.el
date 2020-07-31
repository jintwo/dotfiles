;;; init-flycheck.el --- flycheck config
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :defer t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package helm-flycheck
  :requires helm
  :ensure t
  :defer t
  :config
  (define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
