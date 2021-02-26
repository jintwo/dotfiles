;;; init-flycheck.el --- flycheck config
;;; Commentary:
;;; Code:
(use-package flycheck
  :hook (after-init-hook . global-flycheck-mode))

(use-package helm-flycheck
  :after flycheck
  :bind (:map flycheck-mode-map
              ("C-c ! h" . helm-flycheck)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
