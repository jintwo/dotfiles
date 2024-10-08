;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package which-key
  :defer 0
  :delight
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))

(use-package memento-mori
  :defer 1
  :custom
  (memento-mori-birth-date "1987-04-14")
  :config
  (memento-mori-mode t))

;; TODO: add consult-dash + dash-docs

(use-package gcmh
  :delight)

(defun j2/magit-current-project ()
  (interactive)
  (magit-status (project-root (project-current t))))

;; project
(use-package project
  :custom
  (project-switch-commands '((project-find-file "Find file")
                             (consult-ripgrep "Ripgrep" ?r)
                             (project-dired "Dired")
                             (j2/magit-current-project "Magit" ?m)
                             (eat-project-other-window "Eat" ?e))))

(use-package reveal-in-folder
  :defer 1)

(use-package dwim-shell-command
  :defer 1)

(use-package transmission
  :defer 1
  :bind (:map global-map (("s-t" . transmission))))

(use-package elpher
  :defer 1
  :bind (:map global-map (("s-e" . elpher))))

(use-package osc
  :ensure t)

(use-package eat
  :ensure t
  :config
  (setq eat-term-name "eat-mono")
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)
  ;; allow ace-window
  (require 'eat)
  (push '[?\e ?o] eat-semi-char-non-bound-keys)
  (eat-update-semi-char-mode-map)
  (eat-reload))

(use-package ediff
  :config
  (setq ediff-window-setup-function 'ediff-setup-windows-plain
        ediff-split-window-function 'split-window-horizontally))

(setq delete-by-moving-to-trash t)

;; TODO: ebook tools
;; calibredb
;; nov

(provide 'init-utils)
;;; init-utils.el ends here
