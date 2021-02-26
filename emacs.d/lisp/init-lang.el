;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux")

;; c-like
(use-package ccls
  :defer t
  :config
  (when (featurep 'init-lsp)
    (progn
      (add-hook 'c-mode-hook #'lsp-deferred)
      (add-hook 'c++-mode-hook #'lsp-deferred)
      (add-hook 'objc-mode-hook #'lsp-deferred)))
  (when (featurep 'init-eglot)
      (progn
        (add-hook 'c-mode-hook #'eglot-ensure)
        (add-hook 'c++-mode-hook #'eglot-ensure)
        (add-hook 'objc-mode-hook #'eglot-ensure))))

;; java
;; (use-package lsp-java
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'java-mode-hook #'lsp))

;; swift
(use-package swift-mode
  :defer t)

;; lua
(use-package lua-mode
  :defer t
  :bind-keymap (("C-c C-r" . lua-send-region)
                ("C-c M-j" . lua-start-process))
  :config
  (setq lua-indent-level 4))

;; (use-package fuel
;;   :ensure t)

;; markup
(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

(use-package markdown-mode
  :mode ("\\.text\\'" "\\.markdown\\'" "\\.md\\'"))

;; conf
(use-package protobuf-mode
  :mode "\\.proto\\'")

(use-package dockerfile-mode
  :defer t)

(use-package graphviz-dot-mode
  :defer t)

;; prolog
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . prolog-mode))

(provide 'init-lang)
;;; init-lang.el ends here
