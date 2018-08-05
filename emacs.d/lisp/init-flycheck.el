;;; init-flycheck.el --- flycheck mode config
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
