;;; init-sp.el --- smartparens mode config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package smartparens
  :ensure t
  :delight
  :hook (prog-mode text-mode markdown-mode)
  :config
  (require 'smartparens-config)
  (sp-use-smartparens-bindings))

(provide 'init-sp)
;;; init-sp.el ends here
