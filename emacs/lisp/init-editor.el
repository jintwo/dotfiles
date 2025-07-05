;;; init-editor --- editor config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; (setq undo-outer-limit 24000000)

(use-package vundo
  :ensure t
  :bind ("C-x u" . vundo)
  :custom
  (vundo-roll-back-on-quit nil)
  (vundo--window-max-height 10))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)))

(use-package symbol-overlay
  :ensure t
  :bind (("M-i" . symbol-overlay-put)
         ("M-n" . symbol-overlay-switch-forward)
         ("M-p" . symbol-overlay-switch-backward)
         ("<f7>" . symbol-overlay-mode)
         ("<f8>" . symbol-overlay-remove-all))
  :config
  (symbol-overlay-mode t))

(use-package iedit
  :ensure t)

(use-package wgrep
  :ensure t)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(use-package avy
  :ensure t
  :config
  (avy-setup-default))

(use-package casual-avy
  :ensure t
  :bind ("M-g v" . casual-avy-tmenu))

(use-package display-fill-column-indicator
  :ensure t
  :custom
  (fill-column 120)
  :config
  (global-display-fill-column-indicator-mode t))

(use-package highlight-indent-guides
  :hook ((prog-mode conf-mode yaml-mode yaml-ts-mode) . highlight-indent-guides-mode)
  :delight
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-odd-face-perc 45
        highlight-indent-guides-auto-even-face-perc 45
        highlight-indent-guides-auto-character-face-perc 60))

(use-package whole-line-or-region
  :delight whole-line-or-region-local-mode
  :config
  (whole-line-or-region-global-mode t))

(use-package stripspace
  :ensure t

  ;; Enable for prog-mode-hook, text-mode-hook, conf-mode-hook
  :hook ((prog-mode . stripspace-local-mode)
         (text-mode . stripspace-local-mode)
         (conf-mode . stripspace-local-mode))

  :custom
  ;; The `stripspace-only-if-initially-clean' option:
  ;; - nil to always delete trailing whitespace.
  ;; - Non-nil to only delete whitespace when the buffer is clean initially.
  ;; (The initial cleanliness check is performed when `stripspace-local-mode'
  ;; is enabled.)
  (stripspace-only-if-initially-clean nil)

  ;; Enabling `stripspace-restore-column' preserves the cursor's column position
  ;; even after stripping spaces. This is useful in scenarios where you add
  ;; extra spaces and then save the file. Although the spaces are removed in the
  ;; saved file, the cursor remains in the same position, ensuring a consistent
  ;; editing experience without affecting cursor placement.
  (stripspace-restore-column t))


(use-package rainbow-delimiters
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package move-dup
  :defer t
  :delight
  :hook (prog-mode . move-dup-mode))

(use-package electric
  :config
  (electric-indent-mode t))

(use-package emacs
  :delight
  (visual-line-mode))

(use-package eldoc
  :delight)

;; (setq-default truncate-lines t)
(global-visual-line-mode t)

(use-package subword
  :delight
  :config
  (global-subword-mode t))

(when (executable-find "rg")
  (setq grep-program "rg"))

(when (executable-find "fd")
  (setq find-program "fd"))

;; recentf
(use-package recentf
  :ensure t
  :config
  (recentf-mode 1)
  (setq-default recentf-max-saved-items 1000
                recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'"))
                recentf-max-menu-items 50))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; paren
(show-paren-mode t)
(setq show-paren-delay 0)
(add-hook 'prog-mode-hook
          (lambda ()
            (set-face-attribute 'show-paren-match nil :inverse-video t)))

;; line numbers
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t)))

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

(use-package persistent-scratch
  :ensure t
  :config
  (persistent-scratch-setup-default))

(use-package tempo
  :config
  (setq tempo-interactive t))

(setq compilation-scroll-output t)

(use-package autorevert
  :delight auto-revert-mode)

(use-package treesit-fold
  :ensure t
  :vc (:url "https://github.com/emacs-tree-sitter/treesit-fold.git"
       :rev :newest)
  :config
  (require 'treesit-fold)
  (global-treesit-fold-mode t))

(use-package remember
  :bind ("C-c M-r" . remember)
  :config
  (setq initial-buffer-choice 'remember-notes
        remember-data-file "~/Sync/Org/remember.org"
        remember-notes-initial-major-mode 'org-mode
        remember-in-new-frame nil))

(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

;; timestamp (disabled but can be useful)
;; (setq time-stamp-active t          ; Do enable time-stamps.
;;       time-stamp-line-limit 10     ; Check first 10 buffer lines for Time-stamp: <>
;;       time-stamp-format "Last changed %Y-%02m-%02d %02H:%02M:%02S by %u")

;; (add-hook 'write-file-hooks 'time-stamp) ; Update when saving.

;; narrowing (i found it quite useful)
(put 'narrow-to-region 'disabled nil)

(provide 'init-editor)
;;; init-editor.el ends here
