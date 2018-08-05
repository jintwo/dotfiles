;;; init-haskell.el --- haskell mode config
;;; Commentary:
;;; Code:
(use-package haskell-mode
  :ensure t
  :init
  (progn
    (add-to-list 'exec-path "~/.cabal/bin")
    (add-to-list 'completion-ignored-extensions ".hi"))
  :config
  (use-package company-ghc
    :after haskell-mode)
  (use-package tidal
    :after haskell-mode)
  (defun haskell-mode-init ()
    "Set haskell style."
    (interactive)
    (haskell-indentation-mode)
    (setq tab-width 4
          haskell-indentation-layout-offset 4
          haskell-indentation-left-offset 4
          haskell-indentation-ifte-offset 4
          haskell-indent-spaces 4))
  (add-hook 'haskell-mode-hook 'haskell-mode-init))

(provide 'init-haskell)
;;; init-haskell.el ends here
