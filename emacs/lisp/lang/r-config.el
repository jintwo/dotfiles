;;; r-config.el --- R (ESS) config
;;; Commentary:
;;; Code:
(use-package ess
  :ensure t
  :config
  (setq ess-style 'DEFAULT))

(use-package ess-view-data
  :after ess
  :ensure t
  :config
  (setq ess-view-data-read-string 'completing-read))

(provide 'r-config)
;;; r-config.el ends here
