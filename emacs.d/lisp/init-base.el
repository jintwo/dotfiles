;;; init-base.el --- base config options and utils
;;; Commentary:
;;; Code:
(require 'package)
(require 'misc)

;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(setq package-check-signature nil)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; chords
(use-package use-package-chords
  :ensure t
  :config
  (key-chord-mode t))

(setq use-package-minimum-reported-time 0
      use-package-verbose t)

(if (eq system-type 'darwin)
    (progn
      (global-set-key [kp-delete] 'delete-char)
      (setq ns-function-modifier 'hyper))
    ;  (setq mac-command-modifier 'meta)
    ;  (setq mac-option-modifier 'super)
    ;  (setq mac-control-modifier 'control)
  (global-set-key (kbd "s-k") 'kill-this-buffer))

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-c l") 'join-line)
(global-set-key (kbd "C-c n") (lambda () (interactive) (join-line 1)))

(global-set-key (kbd "M-f") 'forward-to-word)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(electric-indent-mode +1)

(provide 'init-base)
;;; init-base.el ends here
