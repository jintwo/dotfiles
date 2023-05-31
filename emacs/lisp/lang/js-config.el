;;; js-config.el --- js config
;;; Commentary:
;;; Code:
(use-package js2-mode
  :ensure t
  :init
  (add-hook 'js-mode-hook #'j2/project-eglot-ensure)
  (add-hook 'js-ts-mode-hook #'j2/project-eglot-ensure))

(use-package typescript-mode
  :ensure t
  :custom
  (typescript-indent-level 2)
  :init
  (add-hook 'typescript-mode-hook #'j2/project-eglot-ensure)
  (add-hook 'typescript-ts-mode-hook #'j2/project-eglot-ensure)
  (add-hook 'tsx-ts-mode-hook #'j2/project-eglot-ensure))

;; deno
;; (add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

;; (defclass eglot-deno (eglot-lsp-server) ()
;;   :documentation "A custom class for deno lsp.")

;; (cl-defmethod eglot-initialization-options ((server eglot-deno))
;;   "Passes through required deno initialization options"
;;   (list :enable t :lint t))

(provide 'js-config)
;;; js-config.el ends here
