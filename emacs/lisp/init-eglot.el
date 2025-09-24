;;; init-eglot.el
;;; Commentary:
;;; Code:
(use-package eglot
  :bind (:map prog-mode-map (("C-c e r" . eglot-rename)))
  :hook ((eglot-managed-mode . manually-activate-flymake))
  :config
  (add-to-list 'eglot-stay-out-of 'flymake))

(defun manually-activate-flymake ()
  (add-hook 'flymake-diagnostic-functions #'eglot-flymake-backend nil t)
  (flymake-mode t))

(when (featurep 'consult-eglot)
  (add-hook 'prog-mode-hook
            (lambda () (keymap-local-set "C-c e j" 'consult-eglot-symbols))))

(defun j2/project-eglot-ensure ()
  (interactive)
  (when (project-current)
    (eglot-ensure)))

(use-package eglot-booster
  :after eglot
  :ensure t
  :vc (:url "https://github.com/jdtsmith/eglot-booster"
       :rev :newest)
  :config (eglot-booster-mode))

(provide 'init-eglot)
;;; init-eglot.el ends here
