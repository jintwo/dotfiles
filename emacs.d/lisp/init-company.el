;;; init-company.el --- company mode config
;;; Commentary:
;;; Code:
(jin/require-package 'company)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here
