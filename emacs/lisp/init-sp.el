;;; init-sp.el --- smartparens mode config
;;; Commentary:
;;; Code:
(use-package smartparens
  :defer 1
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1)
  :custom
  (sp-base-key-bindings 'sp))

(provide 'init-sp)
;;; init-sp.el ends here
