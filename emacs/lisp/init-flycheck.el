;;; init-flycheck.el --- flycheck config
;;; Commentary:
;;; Code:
(use-package flycheck
  :hook (after-init-hook . global-flycheck-mode))

(use-package consult-flycheck
  :after flycheck)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
