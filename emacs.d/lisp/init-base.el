;;; init-base.el --- base config options and utils
;;; Commentary:
;;; Code:
(require 'package)

;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)
(setq package-check-signature nil)

(when (not package-archive-contents)
    (package-refresh-contents))

(defun jin/require-package (pkg &rest packages)
  "Install package PKG and PACKAGES if not installed."
  (dolist (p (cons pkg packages))
          (unless (package-installed-p p)
            (package-install p))))

(defun jin/add-auto-mode (mode &rest patterns)
  "Set MODE for filenames PATTERNS."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(if (eq system-type 'darwin)
    (progn
      (global-set-key [kp-delete] 'delete-char))
    ;  (setq mac-command-modifier 'meta)
    ;  (setq mac-option-modifier 'super)
    ;  (setq mac-control-modifier 'control)
    ;  (setq ns-function-modifier 'hyper))
  (global-set-key (kbd "s-k") 'kill-this-buffer))

(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "RET") 'newline-and-indent)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(electric-indent-mode +1)

(provide 'init-base)
;;; init-base.el ends here
