;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux")

;; java
;; (use-package lsp-java
;;   :ensure t
;;   :defer t
;;   :config
;;   (add-hook 'java-mode-hook #'lsp))

;; swift
(use-package swift-mode
  :ensure t
  :defer t)

;; lua
(use-package lua-mode
  :ensure t
  :defer t
  :bind (:map lua-mode-map
              (("C-c C-r" . lua-send-region)
               ("C-c M-j" . lua-start-process)))
  :config
  (setq lua-indent-level 4))

;; (use-package fuel
;;   :ensure t)

;; js
(use-package js2-mode
  :ensure t
  :defer t
  :mode (("\\.js\\'" . js2-jsx-mode)
         ("\\.jsx\\'" . js2-jsx-mode)))

(use-package json-mode
  :ensure t
  :defer t
  :init (setq js-indent-level 2)
  :mode ("\\.json\\'" "\\.avsc\\'"))

(use-package yaml-mode
  :ensure t
  :defer t)

;; markup
(use-package web-mode
  :ensure t
  :defer t
  :mode "\\.html\\'")

(use-package markdown-mode
  :ensure t
  :defer t
  :mode ("\\.text\\'" "\\.markdown\\'" "\\.md\\'"))

;; conf
(use-package protobuf-mode
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :defer t)

(add-hook 'conf-mode-hook (lambda () (setq tab-width 4)))

;; prolog
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . prolog-mode))

(provide 'init-lang)
;;; init-lang.el ends here
