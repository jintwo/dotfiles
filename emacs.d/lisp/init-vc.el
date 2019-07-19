;;; init-vc.el --- version control config
;;; Commentary:
;;; Code:
;; git
(use-package magit
  :ensure t
  :config
  (use-package gitconfig-mode)
  (use-package gitignore-mode)
  (use-package magit-todos
    :ensure t
    :config
    (magit-todos-mode)))

(provide 'init-vc)
;;; init-vc.el ends here
