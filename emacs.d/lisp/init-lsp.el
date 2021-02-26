;;; init-lsp.el --- Language Server Protocol related config
;;; Commentary:
;;; Code:
;;
(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :config
  (setq lsp-log-io nil
        lsp-idle-delay 0.5)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-peek-enable nil)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-imenu-enable nil))

(use-package company-lsp
  :after (company lsp-mode)
  :commands company-lsp)

(provide 'init-lsp)
;;; init-lsp.el ends here
