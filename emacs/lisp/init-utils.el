;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :demand t
  :config
  (exec-path-from-shell-initialize))

(use-package restclient
  :mode ("\\.http\\'"))

(use-package which-key
  :defer 0
  :diminish which-key-mode
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

(use-package gcmh)

;; org-timer
(add-hook 'org-timer-done-hook (lambda () (message "timer done!")))
(keymap-global-set "C-c t" 'org-timer-set-timer)

;; project
(customize-set-variable 'project-switch-commands '((project-find-file "Find file")
                                                   (consult-ripgrep "Ripgrep" ?r)
                                                   (project-dired "Dired")
                                                   (magit-status "Magit" ?m)
                                                   (project-eshell "Eshell")))
(provide 'init-utils)
;;; init-utils.el ends here
