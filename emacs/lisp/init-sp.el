;;; init-sp.el --- smartparens mode config
;;; Commentary:
;;; Code:
(use-package smartparens
  :ensure t
  :hook (prog-mode text-mode markdown-mode)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings))

(provide 'init-sp)
;;; init-sp.el ends here
