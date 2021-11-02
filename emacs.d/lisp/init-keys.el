;;; init-keys.el --- common keyboard shortcuts config
;;; Commentary:
;;; Code:
;; enable key chords
(use-package key-chord)

(key-chord-mode t)

;; emacs-mac bindings
(setq mac-function-modifier 'hyper
      mac-option-modifier 'meta
      mac-command-modifier 'super)

;; keys
(global-set-key [kp-delete] 'delete-char)

(global-set-key (kbd "s-k") 'kill-this-buffer)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-c l") 'join-line)
(global-set-key (kbd "C-c n") (lambda () (interactive) (join-line 1)))

(global-set-key (kbd "M-f") 'forward-to-word)

(global-set-key (kbd "M-/") 'hippie-expand)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(defun split-term ()
  (interactive)
  (let ((window (split-window-below)))
    (select-window window)
    (ansi-term "/usr/local/bin/zsh")))

(global-set-key (kbd "C-c C-t") #'split-term)

(provide 'init-keys)
;;; init-keys.el ends here
