;;; init-company.el --- Company completion config
;;; Commentary:
;;; Code:

(use-package company
  :defer 1
  :bind ("M-<tab>" . company-complete)
  :config
  (setq company-idle-delay nil
        company-show-numbers t
        company-tooltip-limit 10
        company-minimum-prefix-length 2
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above nil)
  (global-company-mode))

(provide 'init-company)
;;; init-company.el ends here
