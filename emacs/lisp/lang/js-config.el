;;; js-config.el --- js config
;;; Commentary:
;;; Code:
(use-package js2-mode
  :defer t)

(use-package typescript-mode
  :defer t)

(use-package tide
  :defer t)

(when (featurep 'tree-sitter-hl)
  (add-hook 'typescript-mode-hook #'tree-sitter-hl-mode))

(when (featurep 'init-eglot)
  (require 'eglot)

  (add-to-list 'eglot-server-programs '((js-mode typescript-mode) . (eglot-deno "deno" "lsp")))

  (defclass eglot-deno (eglot-lsp-server) ()
    :documentation "A custom class for deno lsp.")

  (cl-defmethod eglot-initialization-options ((server eglot-deno))
    "Passes through required deno initialization options"
    (list :enable t :lint t))

  (add-hook 'typescript-mode-hook #'eglot-ensure))

(provide 'js-config)
;;; js-config.el ends here
