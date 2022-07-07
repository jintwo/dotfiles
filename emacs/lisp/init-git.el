;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package magit
  :defer t
  :bind (("C-c C-g" . magit-status))
  :custom
  (magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(use-package git-modes
  :defer t)

(use-package magit-delta
  :defer t
  :hook (magit-mode . magit-delta-mode)
  :config
  (setq magit-delta-default-light-theme "Solarized (light)"
        magit-delta-default-dark-theme "Nord"))

(provide 'init-git)
;;; init-git.el ends here
