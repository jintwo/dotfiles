;;; init-eglot.el
;;; Commentary:
;;; Code:
(use-package eglot
  :bind (:map prog-mode-map (("s-r" . eglot-rename)))
  :hook ((eglot-managed-mode . manually-activate-flymake))
  :config
  (setq eglot-ignored-server-capabilities '(:hoverProvider
                                            :inlayHintProvider
                                            ;; optionally :signatureHelpProvider
                                            ))
  (add-to-list 'eglot-stay-out-of 'flymake))


(defun manually-activate-flymake ()
  (add-hook 'flymake-diagnostic-functions #'eglot-flymake-backend nil t)
  (flymake-mode t))

(when (featurep 'consult-eglot)
  (add-hook 'prog-mode-hook
            (lambda () (keymap-local-set "s-j" 'consult-eglot-symbols))))

(defun j2/project-eglot-ensure ()
  (interactive)
  (when (project-current)
    (eglot-ensure)))

(provide 'init-eglot)
;;; init-eglot.el ends here
