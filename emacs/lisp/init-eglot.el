;;; init-eglot.el
;;; Commentary:
;;; Code:
(use-package eglot
  :custom
  (eglot-ignored-server-capabilities '(:hoverProvider))) ;; optionally :signatureHelpProvider

(provide 'init-eglot)
;;; init-eglot.el ends here
