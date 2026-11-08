;;; init-keys.el --- common keyboard shortcuts config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; INFO
;; global binding C+x
;; local bindings C+c

;; emacs-mac bindings
(setq mac-function-modifier 'hyper
      mac-option-modifier 'meta
      mac-command-modifier 'super)

(when (eq system-type 'darwin)
  (keymap-global-unset "s-w")
  (keymap-global-unset "s-q")
  (keymap-global-unset "s-h"))

;; editor
(keymap-global-set "M-z" #'zap-up-to-char)
(keymap-global-set "M-f" #'forward-to-word)

(keymap-global-set "M-/" #'hippie-expand)

(keymap-global-set "C-s" #'isearch-forward-regexp)
(keymap-global-set "C-r" #'isearch-backward-regexp)
(keymap-global-set "C-M-s" #'isearch-forward)
(keymap-global-set "C-M-r" #'isearch-backward)

(keymap-global-set "M-G" #'avy-goto-line)

;; completions
(keymap-global-set "C-<tab>" #'completion-at-point)

;; flymake (straight outta manual)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

(when (featurep 'devdocs)
  (keymap-global-set "C-h D" #'devdocs-lookup))

(when (featurep 'treesit-fold)
  (define-key treesit-fold-mode-map (kbd "<backtab>") #'treesit-fold-toggle))

;; utils
;; (keymap-global-set "C-c l" #'j2/current-location)
(keymap-global-set "s-k" #'kill-current-buffer)

;; org (TODO: move it somewhere to init-org.el)
(keymap-global-unset "C-x C-o")
(keymap-global-set "C-x C-o c" #'org-capture)
(keymap-global-set "C-x C-o a" #'org-agenda)
(keymap-global-set "C-x C-o f" #'org-roam-node-find)
(keymap-global-set "C-x C-o s" #'org-store-link)
(keymap-global-set "C-x C-o i" #'org-insert-link)
(keymap-global-set "C-x C-o n" #'remember-notes)

(define-key org-mode-map (kbd "C-x C-o M-l") #'j2/org-open-linear-link)

(define-key prog-mode-map (kbd "C-c M-m") #'j2/mark-named-region)

(provide 'init-keys)
;;; init-keys.el ends here
