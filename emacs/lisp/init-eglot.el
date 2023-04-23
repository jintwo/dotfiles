;;; init-eglot.el
;;; Commentary:
;;; Code:
(use-package eglot
  :defer t
  :bind (:map prog-mode-map (("s-r" . eglot-rename)))
  :custom
  (eglot-ignored-server-capabilities '(:hoverProvider
                                       :inlayHintProvider))) ;; optionally :signatureHelpProvider

(when (and (featurep 'eglot) (featurep 'consult-eglot))
  (add-hook 'prog-mode-hook
            (lambda () (keymap-local-set "s-j" 'consult-eglot-symbols))))

(provide 'init-eglot)
;;; init-eglot.el ends here
