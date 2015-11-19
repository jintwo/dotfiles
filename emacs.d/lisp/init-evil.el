;;; init-evil.el --- evil mode config
;;; Commentary:
;;; Code:
(jin/require-package 'evil)
(setq-default evil-default-cursor t)
(setq evil-move-cursor-back nil)

(jin/require-package 'evil-nerd-commenter)
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "M-:") 'evilnc-comment-or-uncomment-to-the-line)

(jin/require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "b" 'switch-to-buffer
  "k" 'kill-this-buffer
  "p" 'projectile-switch-project
  "f" 'projectile-find-file
  "r" 'recentf-ido-find-file
  "g" 'magit-status)

(jin/require-package 'evil-magit 'evil-surround)
(global-evil-surround-mode 1)

(defcustom jin/evil-modes
  '(fundamental-mode
    text-mode
    prog-mode
    sws-mode
    dired-mode
    comint-mode
    log-edit-mode
    compilation-mode
    git-commit-mode)
  "List of EViL major modes."
  :type '(repeat (symbol))
  :group 'jin)

(defcustom jin/emacs-modes
  '(git-rebase-mode)
  "List of Emacs major modes."
  :type '(repeat (symbol))
  :group 'jin)

(defun set-evil-mode ()
  "Update EViL mode."
  (when (apply 'derived-mode-p jin/evil-modes)
    (turn-on-evil-mode))
  (when (apply 'derived-mode-p jin/emacs-modes)
    (turn-off-evil-mode)))

(add-hook 'after-change-major-mode-hook 'set-evil-mode)

(provide 'init-evil)
;;; init-evil.el ends here
