;;; haskell-config.el --- haskell config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package haskell-mode
  :mode (rx ".l?hs" eos)
  :hook ((haskell-mode . haskell-mode-init)
         (haskell-mode . j2/project-eglot-ensure))
  :custom
  (haskell-indentation-layout-offset 4)
  (haskell-indentation-left-offset 4))

(defun haskell-mode-init ()
  "Set haskell style."
  (interactive)
  (haskell-indentation-mode t)
  (interactive-haskell-mode t))

(use-package tidal
  :after haskell-mode
  :mode (rx ".tidal" eos))

(provide 'haskell-config)
;;; haskell-config.el ends here
