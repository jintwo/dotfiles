;;; r-config.el --- R (ESS) config
;;; Commentary:
;;; Code:
(use-package ess
  :ensure t)

(use-package ess-view-data
  :after ess
  :ensure t)

(provide 'r-config)
;;; r-config.el ends here
