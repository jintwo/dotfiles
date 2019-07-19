;;; init-flycheck.el --- flycheck mode config
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package helm-flycheck
  :ensure t
  :config
  (define-key flycheck-mode-map (kbd "C-c ! h") 'helm-flycheck)
  (defhydra hydra-flycheck ()
    "errors"
    ("n" flycheck-next-error "next")
    ("p" flycheck-previous-error "previous")
    ("h" helm-flycheck "helm" :color blue)
    ("q" nil "quit"))
  (key-chord-define-global "QF" #'hydra-flycheck/body))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
