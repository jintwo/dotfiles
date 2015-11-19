;;; init-vc.el --- version control config
;;; Commentary:
;;; Code:
;; git
(jin/require-package 'magit 'gitconfig-mode)

(setq magit-last-seen-setup-instructions "1.4.0")

(global-set-key (kbd "C-c C-g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'gist-buffer-private)

(provide 'init-vc)
;;; init-vc.el ends here
