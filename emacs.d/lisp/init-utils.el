;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
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

(use-package wakatime-mode
  :defer 1
  :config
  (setq wakatime-cli-path "/usr/local/bin/wakatime")
  (global-wakatime-mode))

(use-package dash-at-point
  :defer t
  :bind (("C-c C-d" . dash-at-point)
         ("C-c C-e" . dash-at-point-with-docset)))

(use-package gcmh)

;; org-timer
(add-hook 'org-timer-done-hook (lambda () (message "timer done!")))
(global-set-key (kbd "C-c t") 'org-timer-set-timer)

(provide 'init-utils)
;;; init-utils.el ends here
