;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux"
              c-basic-offset 4
              js-indent-level 2)

(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))

(require 'lang/ccc)
(require 'lang/cl)
;; (require 'lang/clojure)
;; (require 'lang/elixir)
;; (require 'lang/erlang)
;; (require 'lang/go)
;; (require 'lang/haskell)
(require 'lang/janet)
;; (require 'lang/java)
(require 'lang/lua)
;; (require 'lang/ocaml)
;; (require 'lang/prolog)
(require 'lang/py)
(require 'lang/rust)
(require 'lang/scheme)
;; (require 'lang/swift)
;; (require 'lang/zig)


;; conf/markup
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
