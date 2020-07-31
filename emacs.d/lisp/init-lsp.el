;;; init-lsp.el --- Language Server Protocol related config
;;; Commentary:
;;; Code:
;; lsp
(use-package lsp-mode
  :ensure t
  :defer t)

(use-package lsp-ui
  :requires lsp-mode
  :ensure t
  :defer t)

(use-package company-lsp
  :ensure t
  :defer t
  :commands company-lsp
  :after (:all company lsp-mode))

(use-package helm-lsp
  :ensure t
  :defer t
  :commands helm-lsp-workspace-symbol
  :after (:all helm lsp-mode))

(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(provide 'init-lsp)
;;; init-lsp.el ends here
