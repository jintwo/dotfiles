;;; init-vc.el --- version control config
;;; Commentary:
;;; Code:
;; git
(jin/require-package 'magit 'gitconfig-mode 'gitignore-mode)

(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'gist-buffer-private)

(provide 'init-vc)
;;; init-vc.el ends here
