;;; init-editor --- editor config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode))

(use-package multiple-cursors
  :ensure t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(use-package avy
  :ensure t
  :config
  (avy-setup-default)
  (when (fboundp 'key-chord-mode)
    (key-chord-define-global "jc" 'avy-goto-char)
    (key-chord-define-global "jl" 'avy-goto-line)))

(use-package corral
  :ensure t)

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(use-package idle-highlight-mode
  :ensure t
  :config
  (idle-highlight-mode t))

(use-package whole-line-or-region
  :ensure t
  :config
  (whole-line-or-region-global-mode t))

;; annotate todos
(setq to-highlight '(".*TODO.*" ".*FIXME.*"))

(defun annotate ()
  "Annotate TODOs in 'prog-mode' buffer."
  (interactive)
  (dolist (text to-highlight)
    (highlight-lines-matching-regexp text)))

(add-hook 'prog-mode-hook 'annotate)

(use-package rainbow-delimiters
  :ensure t
  :commands 'rainbow-delimiters-mode
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package yasnippet
  :ensure t
  :defer t
  :config
  (yas-global-mode t))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(use-package move-dup
  :ensure t
  :bind (("M-<up>" . md-move-lines-up)
         ("M-<down>" . md-move-lines-down)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(electric-indent-mode +1)

(global-visual-line-mode t)

;; recentf
(add-hook 'after-init-hook 'recentf-mode)
(setq-default recentf-max-saved-items 1000
              recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'"))
              recentf-max-menu-items 50
              recentf-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; paren
(show-paren-mode t)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold :underline t)

;; comint fix
(defun comint-shorten-long-lines (text)
  "Shorten TEXT line to 80 symbols."
  (let* ((regexp "^\\(.\\{80\\}\\).*?\\(\"?\\)$")
         (shortened-text (replace-regexp-in-string regexp "\\1\\2" text)))
    (if (string= shortened-text text)
        text
      (propertize shortened-text 'font-lock-face 'shadow 'help-echo text))))

(add-hook 'comint-preoutput-filter-functions 'comint-shorten-long-lines)

(provide 'init-editor)
;;; init-editor.el ends here
