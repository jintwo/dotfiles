;;; init-eglot.el
;;; Commentary:
;;; Code:
(use-package eglot
  :defer t
  :bind (:map prog-mode-map (("s-r" . eglot-rename)))
  :custom
  (eglot-ignored-server-capabilities '(:hoverProvider))) ;; optionally :signatureHelpProvider

(provide 'init-eglot)
;;; init-eglot.el ends here
