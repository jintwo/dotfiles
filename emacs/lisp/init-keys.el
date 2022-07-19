;;; init-keys.el --- common keyboard shortcuts config
;;; Commentary:
;;; Code:
;; enable key chords
(use-package key-chord
  :defer t
  :config
  (key-chord-mode t))

;; emacs-mac bindings
(setq mac-function-modifier 'hyper
      mac-option-modifier 'meta
      mac-command-modifier 'super)

;; editor
(keymap-global-set "s-k" #'kill-this-buffer)
(keymap-global-set "M-z" #'zap-up-to-char)
(keymap-global-set "C-c l" #'join-line)
(keymap-global-set "C-c n" (lambda () (interactive) (join-line 1)))
(keymap-global-set "M-f" #'forward-to-word)
(keymap-global-set "M-/" #'hippie-expand)
(keymap-global-set "C-s" #'isearch-forward-regexp)
(keymap-global-set "C-r" #'isearch-backward-regexp)
(keymap-global-set "C-M-s" #'isearch-forward)
(keymap-global-set "C-M-r" #'isearch-backward)

;; utils
(keymap-global-set "C-c C-t" #'j2/split-term)
(keymap-global-set "C-c C-l" #'j2/current-location)

;; org
(keymap-global-set "C-c i" #'j2/jump-to-org-index)
(keymap-global-set "C-c c" #'org-capture)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c t" #'org-timer-set-timer)
(keymap-global-set "C-c r f" #'org-roam-node-find)

(provide 'init-keys)
;;; init-keys.el ends here
