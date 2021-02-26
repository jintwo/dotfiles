;;; init-lsp.el --- Language Server Protocol related config
;;; Commentary:
;;; Code:
(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :config
  (setq lsp-log-io nil
        lsp-idle-delay 0.5)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp . lsp-ui-mode)
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references))
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-imenu-enable nil))

(use-package company-lsp
  :after (company lsp-mode)
  :commands company-lsp)

;; (use-package helm-lsp
;;   :defer t
;;   :commands helm-lsp-workspace-symbol
;;   :after (:all helm lsp-mode))

(provide 'init-lsp)
;;; init-lsp.el ends here
