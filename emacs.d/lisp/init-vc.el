;;; init-vc.el --- version control config
;;; Commentary:
;;; Code:
;; git
(use-package magit
  :ensure t
  :bind ("C-c C-g" . magit-status)
  :config
  (use-package gitconfig-mode)
  (use-package gitignore-mode))

(provide 'init-vc)
;;; init-vc.el ends here
