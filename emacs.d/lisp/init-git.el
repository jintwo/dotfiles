;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package gitconfig-mode
  :defer t)

(use-package gitignore-mode
  :defer t)

(use-package magit
  :defer t
  :bind (("C-c C-g" . magit-status))
  :custom
  (magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1))

(provide 'init-git)
;;; init-git.el ends here
