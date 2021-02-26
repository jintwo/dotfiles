;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :defer 0
  :config
  (exec-path-from-shell-initialize))

(use-package helm-ag
  :defer t)

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
  (global-wakatime-mode))

(use-package dash-at-point
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))

(use-package gcmh)

(provide 'init-utils)
;;; init-utils.el ends here
