;;; init-haskell.el --- haskell mode config
;;; Commentary:
;;; Code:
(jin/require-package 'haskell-mode)

(add-to-list 'exec-path "~/.cabal/bin")
(add-to-list 'completion-ignored-extensions ".hi")

(defun haskell-style ()
  "Set haskell style."
  (interactive)
  (turn-on-haskell-indentation)
  (setq tab-width 4
        haskell-indentation-layout-offset 4
        haskell-indentation-left-offset 4
        haskell-indentation-ifte-offset 4
        haskell-process-use-ghci t
        haskell-indent-spaces 4))
(add-hook 'haskell-mode-hook 'haskell-style)

(provide 'init-haskell)
;;; init-haskell.el ends here
