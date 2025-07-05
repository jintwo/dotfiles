;;; init-keys.el --- common keyboard shortcuts config
;;; Commentary:
;;; Code:
;; emacs-mac bindings
(setq mac-function-modifier 'hyper
      mac-option-modifier 'meta
      mac-command-modifier 'super)

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
  (keymap-global-set "S-<tab>" #'treesit-fold-toggle))

;; utils
;; (keymap-global-set "C-c l" #'j2/current-location)
(keymap-global-set "s-k" #'kill-current-buffer)

;; project
(when (featurep 'eat)
  (keymap-global-set "<remap> <project-shell>" #'eat-project))

;; org (TODO: move it somewhere to init-org.el)
(keymap-global-set "C-c j" #'j2/org-jump)
(keymap-global-set "C-c c" #'org-capture)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c f" #'org-roam-node-find)
(keymap-global-set "C-c l" #'org-store-link)
(keymap-global-set "C-c k" #'org-insert-link)
(keymap-global-set "C-c n" #'remember-notes)
(define-key org-mode-map (kbd "C-c C-x M-l") #'j2/org-open-linear-link)

(provide 'init-keys)
;;; init-keys.el ends here
