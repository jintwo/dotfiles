;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux"
              c-basic-offset 4)

;; quickrun
(use-package quickrun
  :ensure t)

;; tree-sitter stuff
(use-package tree-sitter
  :ensure t
  :config
  (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :ensure t)

(use-package tree-sitter-indent
  :defer t)

;; ts-fold is broken now
;; (unless (package-installed-p 'ts-fold)
;;   (package-vc-install "https://www.github.com/emacs-tree-sitter/ts-fold"))

;; (when (package-installed-p 'ts-fold)
;;   (require 'ts-fold)
;;   (global-ts-fold-mode t)
;;   (keymap-global-set "C-<tab>" #'ts-fold-toggle)
;;   )

(add-to-list 'load-path (expand-file-name "lisp/lang" user-emacs-directory))

(require 'ccc-config)
(require 'cl-config)
(require 'clojure-config)
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
(require 'csound-config)

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
              (setq js-indent-level 2)
              (setq indent-tabs-mode nil)
              (setq json-encoding-default-indentation "  "))))

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

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . prog-mode))

(provide 'init-lang)
;;; init-lang.el ends here
