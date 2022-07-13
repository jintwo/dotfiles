;;; init-editor --- editor config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package undo-tree
  :defer 1
  :config
  (global-undo-tree-mode))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package iedit
  :ensure t)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy
  :defer t
  :config
  (avy-setup-default))

(use-package highlight-indent-guides
  :hook ((prog-mode conf-mode yaml-mode) . highlight-indent-guides-mode)
  :init
  (highlight-indent-guides-auto-set-faces)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-odd-face-perc 45
        highlight-indent-guides-auto-even-face-perc 45
        highlight-indent-guides-auto-character-face-perc 60))

(use-package idle-highlight-mode
  :hook (prog-mode . idle-highlight-mode))

(use-package whole-line-or-region
  :config
  (whole-line-or-region-global-mode t))

;; annotate todos
(setq to-highlight '(".*TODO.*" ".*FIXME.*"))

(defun j2/annotate-todos ()
  "Annotate TODOs in 'prog-mode' buffer."
  (interactive)
  (dolist (text to-highlight)
    (highlight-lines-matching-regexp text)))

(add-hook 'prog-mode-hook #'j2/annotate-todos)

(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

;; still not using it (should disable/remove?)
(use-package yasnippet
  :defer t
  :config
  (yas-global-mode t))

(use-package yasnippet-snippets
  :defer t)

(use-package move-dup
  :bind (("M-<up>" . move-dup-move-lines-up)
         ("M-<down>" . move-dup-move-lines-down))
  :config
  (global-move-dup-mode))

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
(add-hook 'prog-mode-hook
          (lambda ()
            (set-face-attribute 'show-paren-match nil :inverse-video t)))

(global-display-line-numbers-mode)

;; replace current selection with anything
(delete-selection-mode t)

;; custom (TODO: move to init-prog.el)
(defun j2/current-location ()  ;; stolen from http://mbork.pl/2022-06-20_Copying_the_current_location
  "Show the current location and put it into the kill ring.
Use the filename relative to the current VC root directory."
  (interactive)
  (let* ((file-name (file-relative-name buffer-file-name (vc-root-dir)))
	 (line-number (line-number-at-pos nil t))
	 (location (format "%s:%s" file-name line-number)))
    (kill-new location)
    (message location)))

(provide 'init-editor)
;;; init-editor.el ends here
