;;; init-haskell.el --- Haskell dev config
;;; Commentary:
;;; Code:
(use-package haskell-mode
  :ensure t
  :defer t
  :init
  (progn
    (add-to-list 'exec-path "~/.cabal/bin")
    (add-to-list 'completion-ignored-extensions ".hi"))
  :custom
  (haskell-indentation-layout-offset 4)
  (haskell-indentation-left-offset 4))

(defun haskell-mode-init ()
  "Set haskell style."
  (interactive)
  (haskell-indentation-mode))

(add-hook 'haskell-mode-hook 'haskell-mode-init)

(use-package tidal
  :requires haskell-mode
  :ensure t
  :defer t)

(provide 'init-haskell)
;;; init-haskell.el ends here
