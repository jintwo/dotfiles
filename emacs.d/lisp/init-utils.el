;;; init-utils.el --- additional tools config
;;; Commentary:
;;; Code:
;; whitespace
(global-whitespace-mode)
(setq whitespace-line-column 100)
(setq whitespace-style '(face empty trailing lines-tail))
(setq whitespace-global-modes '(not go-mode))

;; re-builder
(setq reb-re-syntax 'string)

;; tramp
(setq tramp-default-method "ssh")

;; undo-tree
(jin/require-package 'undo-tree)
(global-undo-tree-mode)

;; ag
(jin/require-package 'ag)

;; rainbow-delimiters
(jin/require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook (lambda ()
                            (rainbow-delimiters-mode)))
                            ;; (whitespace-mode)))

;; yas
(jin/require-package 'yasnippet)
(yas-global-mode t)

;; eshell
(defun eshell-mode-hook-func ()
  "Update eshell env."
  (setq eshell-path-env (concat "/usr/local/bin:" eshell-path-env))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH"))))
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;; neotree
(jin/require-package 'neotree)
(global-set-key (kbd "<f5>") 'neotree-toggle)

;; multiple-cursors
(jin/require-package 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; linum
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

;; aliases
(defalias 'yes-or-no-p 'y-or-n-p)

;; annotate todos
(defun annotate-todo ()
  "Annotate TODOs in 'prog-mode' buffer."
  (interactive)
  (highlight-lines-matching-regexp ".*TODO:.*")
  (highlight-lines-matching-regexp ".*FIXME:.*"))
(add-hook 'prog-mode-hook 'annotate-todo)

(provide 'init-utils)
;;; init-utils.el ends here
