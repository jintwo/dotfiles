;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux"
              c-basic-offset 4)

;; tree-sitter stuff
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter-indent
  :defer t)

(unless (package-installed-p 'ts-fold)
  (package-vc-install "https://www.github.com/emacs-tree-sitter/ts-fold"))

(when (package-installed-p 'ts-fold)
  (require 'ts-fold)
  (add-hook 'tree-sitter-after-on-hook #'ts-fold-indicators-mode))

(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))

(require 'ccc-config)
(require 'cl-config)
;; (require 'clojure-config)
;; (require 'elixir-config)
;; (require 'erlang-config)
(require 'go-config)
;; (require 'haskell-config)
(require 'janet-config)
;; (require 'java-config)
(require 'js-config)
(require 'lua-config)
(require 'ocaml-config)
;; (require 'prolog-config)
(require 'python-config)
(require 'rust-config)
(require 'scheme-config)
(require 'swift-config)
(require 'zig-config)
(require 'sc-config)

;; conf/markup
;; (use-package jsonian
;;   :ensure nil
;;   :after so-long
;;   :custom
;;   (jsonian-no-so-long-mode))

(use-package json-mode
  :mode ("\\.json")
  :config
  (add-hook 'json-mode-hook
            (lambda ()
              (tree-sitter-hl-mode)
              (setq indent-tabs-mode nil))))

(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

(use-package markdown-mode
  :mode ("\\.text\\'" "\\.markdown\\'" "\\.md\\'"))

(use-package protobuf-mode
  :mode "\\.proto\\'")

(use-package dockerfile-mode
  :defer t)

(use-package graphviz-dot-mode
  :defer t)

(provide 'init-lang)
;;; init-lang.el ends here
