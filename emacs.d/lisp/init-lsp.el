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
        lsp-rust-server 'rust-analyzer
        lsp-lens-enable nil
        lsp-headerline-breadcrumb-icons-enable nil
        lsp-modeline-diagnostics-mode nil
        lsp-modeline-code-actions-mode nil)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\]build")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\]_build"))

(provide 'init-lsp)
;;; init-lsp.el ends here
