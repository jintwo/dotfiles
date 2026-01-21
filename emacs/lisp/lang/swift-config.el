;;; swift-config.el --- swift config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(swift-mode . ,(eglot-alternatives `(("xcrun" "sourcekit-lsp"))))))

(use-package swift-mode
  :defer t
  :hook (swift-mode . j2/project-eglot-ensure))

;; (use-package swift-ts-mode
;;   :ensure t)

(provide 'swift-config)
;;; swift-config.el ends here
