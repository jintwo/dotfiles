;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux"
              c-basic-offset 4)

(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))

;; utils
(use-package tree-sitter
  :defer t)

(use-package tree-sitter-langs
  :defer t)

(use-package tree-sitter-indent
  :defer t)

(require 'ccc-config)
(require 'cl-config)
;; (require 'clojure-config)
;; (require 'elixir-config)
;; (require 'erlang-config)
(require 'go-config)
;; (require 'haskell-config)
(require 'janet-config)
;; (require 'java-config)
(require 'lua-config)
(require 'ocaml-config)
;; (require 'prolog-config)
(require 'python-config)
(require 'rust-config)
(require 'scheme-config)
;; (require 'swift-config)
;; (require 'zig-config)


;; conf/markup
(use-package jsonian
  :ensure t)

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
