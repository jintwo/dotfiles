;;; init-utils.el --- additional tools config
;;; Commentary:
;;; Code:

;; whitespace
(require 'whitespace)
(global-whitespace-mode)
(setq whitespace-line-column 120
      whitespace-style '(face empty trailing lines-tail)
      whitespace-global-modes '(not go-mode))

;; re-builder
(require 're-builder)
(setq reb-re-syntax 'string)

;; tramp
(require 'tramp)
(setq tramp-default-method "ssh")

;; undo-tree
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

;; ag
(use-package ag
  :ensure t)

;; rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook (lambda ()
                              (rainbow-delimiters-mode))))

;; yas
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))

;; eshell
(require 'eshell)
(defun eshell-mode-hook-func ()
  "Update eshell env."
  (setq eshell-path-env (concat "~/bin:/usr/local/bin:" eshell-path-env))
  (setenv "PATH" (concat "~/bin:/usr/local/bin:" (getenv "PATH"))))
(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;; exec-path-from-shell
(use-package exec-path-from-shell
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

;; linum
(require 'linum)
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)
(global-linum-mode t)
(setq linum-format " %d ")

;; dash
(use-package dash-at-point
  :ensure t
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))

;; resize-window
(use-package resize-window
  :ensure t
  :bind ("C-c w" . resize-window))

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

;; restclient
(use-package restclient)

;; paradox
(use-package paradox)

;; powerline
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; expand region
(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

;; which key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package idle-highlight-mode
  :ensure t
  :config
  (idle-highlight-mode t))

(provide 'init-utils)
;;; init-utils.el ends here
