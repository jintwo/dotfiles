;;; init-utils.el --- additional tools config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package helm-rg
  :ensure t
  :defer 1)

(use-package exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :init
  (setq exec-path-from-shell-check-startup-files nil)
  :config
  (exec-path-from-shell-initialize))

(use-package restclient
  :ensure t
  :defer t
  :mode ("\\.http\\'"))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package memento-mori
  :ensure t
  :custom
  (memento-mori-birth-date "1987-04-14")
  :config
  (memento-mori-mode t))

(use-package wakatime-mode
  :ensure t
  :config
  (global-wakatime-mode))

(use-package dash-at-point
  :ensure t
  :bind (("C-c d" . dash-at-point)
         ("C-c e" . dash-at-point-with-docset)))


(provide 'init-utils)
;;; init-utils.el ends here
