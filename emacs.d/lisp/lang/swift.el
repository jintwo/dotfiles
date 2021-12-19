;;; swift.el --- swift config
;;; Commentary:
;;; Code:
(use-package swift-mode
  :defer t)

(when (featurep 'init-eglot)
  (add-hook 'swift-mode-hook #'eglot-ensure))

(when (featurep 'init-lsp)
  (use-package lsp-sourcekit
    :config
    (setq lsp-sourcekit-executable (string-trim (shell-command-to-string "xcrun --find sourcekit-lsp")))
    (add-hook 'swift-mode-hook #'lsp-deferred)))

(provide 'lang/swift)
;;; swift.el ends here
