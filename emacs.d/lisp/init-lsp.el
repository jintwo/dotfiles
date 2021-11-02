;;; init-lsp.el --- Language Server Protocol related config
;;; Commentary:
;;; Code:
;;
(use-package lsp-mode
  :commands (lsp lsp-deffered)
  :config
  (setq lsp-log-io nil
        lsp-idle-delay 0.5
        lsp-enable-file-watchers t
        lsp-file-watch-threshold 1000
        lsp-rust-server 'rust-analyzer)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\]build")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\]_build"))

(use-package lsp-ui
  :commands lsp-ui-mode
  :hook (lsp . lsp-ui-mode)
  :custom
  (lsp-ui-doc-enable nil)
  (lsp-ui-peek-enable nil)
  (lsp-ui-sideline-update-mode 'line)
  (lsp-ui-imenu-enable nil))

(provide 'init-lsp)
;;; init-lsp.el ends here
