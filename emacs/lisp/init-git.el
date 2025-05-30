;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package magit
  :defer t
  :bind (:map magit-mode-map (("C-c C-f" . magit-pull-from-upstream)
                              ("C-c C-p" . magit-push-current-to-upstream)))
  :custom
  (magit-define-global-key-bindings 'recommended)
  (magit-refresh-status-buffer nil)
  (magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (magit-process-finish-apply-ansi-colors nil))

(use-package git-modes
  :defer t)

(use-package bufferfile
  :ensure t
  :vc (:url "https://github.com/jamescherti/bufferfile.el"
       :rev :newest)
  :config
  (setq bufferfile-use-vc t))

(setq dired-vc-rename-file t)

;; stop asking about symlinks
(setq vc-follow-symlinks t)

(provide 'init-git)
;;; init-git.el ends here
