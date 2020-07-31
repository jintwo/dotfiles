;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package gitconfig-mode
  :ensure t)

(use-package gitignore-mode
  :ensure t)

(use-package magit
  :ensure t
  :defer t
  :bind (("C-c C-g" . magit-status)))

(provide 'init-git)
;;; init-git.el ends here
