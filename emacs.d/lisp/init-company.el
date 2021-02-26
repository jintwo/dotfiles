;;; init-company.el --- Company completion config
;;; Commentary:
;;; Code:
(use-package company
  :defer 1
  :config
  (setq company-idle-delay 0.3
        company-show-numbers t
        company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t)
  (global-company-mode))

(provide 'init-company)
;;; init-company.el ends here
