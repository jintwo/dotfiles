;;; init-utils.el --- additional tools config
;;; Commentary:
;;; Code:
;; whitespace
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-line-column 100)
(setq whitespace-style '(face empty trailing lines-tail))
(setq whitespace-global-modes '(not go-mode))

(jin/require-package 'unicode-whitespace)
(unicode-whitespace-setup 'subdued-faces)

;; re-builder
(require 're-builder)
(setq reb-re-syntax 'string)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; undo-tree
(jin/require-package 'undo-tree)
(global-undo-tree-mode)

;; ag
(jin/require-package 'ag)

;; rainbow-delimiters
(jin/require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook (lambda ()
                            (rainbow-delimiters-mode)
                            (whitespace-mode)))

;; yas
(jin/require-package 'yasnippet)
(yas-global-mode t)

;; eshell
(require 'eshell)
(defun eshell-mode-hook-func ()
  "Update eshell env."
  (setq eshell-path-env (concat "~/bin:/usr/local/bin:" eshell-path-env))
  (setenv "PATH" (concat "~/bin:/usr/local/bin:" (getenv "PATH"))))
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;; exec-path-from-shell
(jin/require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; neotree
(jin/require-package 'neotree)
(global-set-key (kbd "<f5>") 'neotree-toggle)

;; multiple-cursors
(jin/require-package 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; linum
(require 'linum)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(global-linum-mode t)
(setq linum-format " %d ")

;; dash
(jin/require-package 'dash-at-point)
(global-set-key (kbd "C-c d") 'dash-at-point)
(global-set-key (kbd "C-c e") 'dash-at-point-with-docset)

;; emamux
(jin/require-package 'emamux)

;; resize-window
(jin/require-package 'resize-window)
(global-set-key (kbd "C-c w") 'resize-window)

;; aliases
(defalias 'yes-or-no-p 'y-or-n-p)

;; annotate todos
(setq to-highlight '(".*TODO.*" ".*FIXME.*"))
(defun annotate ()
  "Annotate TODOs in 'prog-mode' buffer."
  (interactive)
  (dolist (text to-highlight)
    (highlight-lines-matching-regexp text)))

(add-hook 'prog-mode-hook 'annotate)

;; wakatime
(jin/require-package 'wakatime-mode)
(global-wakatime-mode)

;; restclient
(jin/require-package 'restclient)

;; paradox
(jin/require-package 'paradox)

(provide 'init-utils)
;;; init-utils.el ends here
