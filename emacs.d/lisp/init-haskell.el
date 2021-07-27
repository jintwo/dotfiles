;;; init-haskell.el --- Haskell dev config
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

(use-package tidal
  :after haskell-mode
  :mode ("\\.tidal\\'"))

(provide 'init-haskell)
;;; init-haskell.el ends here
