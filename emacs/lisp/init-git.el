;;; init-git.el --- git config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package magit
  :defer t
  :bind (:map magit-mode-map (("C-c C-f" . magit-pull-from-upstream)
                              ("C-c C-p" . magit-push-current-to-upstream)))
  :custom
  (magit-define-global-key-bindings 'default)
  (magit-refresh-status-buffer nil)
  (magit-display-buffer-function 'magit-display-buffer-same-window-except-diff-v1)
  (magit-process-finish-apply-ansi-colors nil)
  :config
  (defun j2/diff-current-blob-buffer-with-file ()
    (interactive)
    (diff (current-buffer) (magit-buffer-file-name) nil 'noasync))
  (keymap-set magit-blob-mode-map "d" #'j2/diff-current-blob-buffer-with-file)

  (defun j2/with-killing-prev-blob-buffer (orig &rest args)
    (let ((prev-buffer (current-buffer))
          (prev-buffer-file-name (buffer-file-name)))
      (apply orig args)
      (when (not (string-equal prev-buffer-file-name (magit-buffer-file-name)))
        (kill-buffer prev-buffer))))

  (advice-add 'magit-blob-previous :around #'j2/with-killing-prev-blob-buffer)
  (advice-add 'magit-blob-next :around #'j2/with-killing-prev-blob-buffer))


(use-package git-modes
  :defer t)

(use-package orgit-forge
  :ensure t)

(use-package bufferfile
  :ensure t
  :vc (:url "https://github.com/jamescherti/bufferfile.el"
       :rev :newest)
  :config
  (setq bufferfile-use-vc t))

(setq dired-vc-rename-file t)

;; stop asking about symlinks
(setq vc-follow-symlinks t)

(use-package diff-hl
  :ensure t
  :hook (dired-mode . diff-hl-dired-mode)
  :config
  (global-diff-hl-mode 1)
  (diff-hl-flydiff-mode 1)
  (unless (display-graphic-p)
    (diff-hl-margin-mode 1)))

(use-package smerge-mode
  :ensure t
  :config
  (setq smerge-command-prefix (kbd "ESC")))

;; (use-package magit-difftastic
;;   :vc (:url "https://github.com/rschmukler/magit-difftastic"
;;        :rev :newest)
;;   :after magit
;;   :config
;;   (setq magit-difftastic-syntax-highlight nil)
;;   (magit-difftastic-mode +1))

(defun j2/magit-stage-dired-marked-files ()
  (interactive)
  (magit-stage-files (dired-get-marked-files) t)
  (dired-unmark-all-marks))

(provide 'init-git)
;;; init-git.el ends here
