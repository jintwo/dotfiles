;;; haskell-config.el --- haskell config
;;; Commentary:
;;; Code:
(use-package haskell-mode
  :mode ("\\.hs\\'" "\\.lhs\\'")
  :hook ((haskell-mode-hook . haskell-mode-init)
         (haskell-mode-hook . j2/project-eglot-ensure))
  :custom
  (haskell-indentation-layout-offset 4)
  (haskell-indentation-left-offset 4))

(defun haskell-mode-init ()
  "Set haskell style."
  (interactive)
  (subword-mode t)
  (haskell-indentation-mode t)
  (interactive-haskell-mode t))

(use-package tidal
  :after haskell-mode
  :mode ("\\.tidal\\'"))

(provide 'haskell-config)
;;; haskell-config.el ends here
