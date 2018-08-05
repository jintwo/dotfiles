;;; init-company.el --- company mode config
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'init-company)
;;; init-company.el ends here
