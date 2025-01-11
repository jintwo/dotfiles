;;; js-config.el --- js config
;;; Commentary:
;;; Code:
(use-package js2-mode
  :ensure t
  :hook ((js-mode js-ts-mode) . j2/project-eglot-ensure))

(use-package typescript-mode
  :ensure t
  :hook ((typescript-mode typescript-ts-mode tsx-ts-mode) . j2/project-eglot-ensure)
  :custom (typescript-indent-level 2))

(use-package svelte-mode
  :ensure t)

;; deno
;; TODO: try deno-ts-mode
;; (require 'eglot)
;; (add-to-list 'eglot-server-programs
;;              '((js-ts-mode js-mode typescript-ts-mode typescript-mode)
;;                . (eglot-deno "deno" "lsp")))

;; (defclass eglot-deno (eglot-lsp-server) ()
;;   :documentation "A custom class for deno lsp.")

;; (cl-defmethod eglot-initialization-options ((server eglot-deno))
;;   "Passes through required deno initialization options"
;;   (list :enable t
;;         :lint t
;;         (make-symbol "deno.suggest.imports.hosts") (list (make-symbol "https://deno.land") t)))

(provide 'js-config)
;;; js-config.el ends here
