;;; init-sp.el --- smartparens mode config
;;; Commentary:
;;; Code:
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings))

(provide 'init-sp)
;;; init-sp.el ends here
