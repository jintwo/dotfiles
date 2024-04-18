;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package magit
  :defer t
  :custom
  (magit-define-global-key-bindings 'recommended)
  (magit-refresh-status-buffer nil)
  (magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(use-package git-modes
  :defer t)

(provide 'init-git)
;;; init-git.el ends here
