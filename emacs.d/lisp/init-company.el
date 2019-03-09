;;; init-company.el --- company mode config
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.5
        company-show-numbers t
        company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  (global-company-mode))

(provide 'init-company)
;;; init-company.el ends here
