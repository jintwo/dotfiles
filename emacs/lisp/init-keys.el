;;; init-keys.el --- common keyboard shortcuts config
;;; Commentary:
;;; Code:
;; emacs-mac bindings
(setq mac-function-modifier 'hyper
      mac-option-modifier 'meta
      mac-command-modifier 'super)

;; editor
(keymap-global-set "M-z" #'zap-up-to-char)
(keymap-global-set "C-c l" #'join-line)
(keymap-global-set "C-c n" (lambda () (interactive) (join-line 1)))
(keymap-global-set "M-f" #'forward-to-word)

(keymap-global-set "M-/" #'hippie-expand)

(keymap-global-set "C-s" #'isearch-forward-regexp)
(keymap-global-set "C-r" #'isearch-backward-regexp)
(keymap-global-set "C-M-s" #'isearch-forward)
(keymap-global-set "C-M-r" #'isearch-backward)

;; flymake (straight outta manual)
(define-key flymake-mode-map (kbd "M-n") 'flymake-goto-next-error)
(define-key flymake-mode-map (kbd "M-p") 'flymake-goto-prev-error)

;; utils
(keymap-global-set "C-c C-l" #'j2/current-location)

;; org (TODO: move it somewhere to init-org.el)
(keymap-global-set "C-c o i" #'j2/jump-to-org-index)
(keymap-global-set "C-c o c" #'org-capture)
(keymap-global-set "C-c o a" #'org-agenda)
(keymap-global-set "C-c o t" #'org-timer-set-timer)
(keymap-global-set "C-c o s" #'org-store-link)
(keymap-global-set "C-c o l" #'org-insert-link)
(keymap-global-set "C-c o f" #'org-roam-node-find)

(provide 'init-keys)
;;; init-keys.el ends here
