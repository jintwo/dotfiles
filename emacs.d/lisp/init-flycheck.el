;;; init-flycheck.el --- flycheck mode config
;;; Commentary:
;;; Code:
(jin/require-package 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
