;;; haskell.el --- haskell config
;;; Commentary:
;;; Code:
(use-package haskell-mode
  :mode ("\\.hs\\'" "\\.lhs\\'")
  :custom
  (haskell-indentation-layout-offset 4)
  (haskell-indentation-left-offset 4)
  :init
  (add-hook 'haskell-mode-hook #'haskell-mode-init))

(defun haskell-mode-init ()
  "Set haskell style."
  (interactive)
  (subword-mode t)
  (haskell-indentation-mode t)
  (interactive-haskell-mode t))

(when (featurep 'init-lsp)
  (use-package lsp-haskell
    :defer t
    :config
    (add-hook 'haskell-mode-hook #'lsp-deferred)))

(when (featurep 'init-eglot)
  (add-hook 'haskell-mode-hook #'eglot-ensure))

(use-package tidal
  :after haskell-mode
  :mode ("\\.tidal\\'"))

(provide 'lang/haskell)
;;; haskell.el ends here
