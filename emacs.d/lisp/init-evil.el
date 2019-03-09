;;; init-evil.el --- evil mode config
;;; Commentary:
;;; Code:
(use-package evil
  :ensure t
  :init
  (progn
    (setq-default evil-default-cursor t)
    (setq evil-move-cursor-back nil))
  :config
  (use-package evil-nerd-commenter
    :after evil
    :bind (("M-;" . evilnc-comment-or-uncomment-lines)
           ("M-:" . evilnc-comment-or-uncomment-to-the-line)))
  (use-package evil-magit
    :after magit)
  (use-package evil-surround
    :after evil
    :init
    (global-evil-surround-mode 1))
  (use-package evil-matchit
    :ensure t
    :config
    (global-evil-matchit-mode 1)))

(defcustom jin/evil-modes
  '(fundamental-mode
    text-mode
    prog-mode
    sws-mode
    dired-mode
    comint-mode
    log-edit-mode
    compilation-mode
    git-commit-mode
    magit-mode)
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
