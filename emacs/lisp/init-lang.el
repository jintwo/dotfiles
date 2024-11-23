;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
(setq-default indent-tabs-mode nil
              tab-width 4
              c-default-style "linux"
              c-basic-offset 4)

;; pretty helpful
(which-function-mode)

;; docs
(use-package devdocs
  :ensure t)

;; quickrun
(use-package quickrun
  :ensure t)

;; dumb-jump
(use-package dumb-jump
  :ensure t
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
  (setq xref-show-definitions-function #'xref-show-definitions-completing-read
        dumb-jump-prefer-searcher 'rg
        dumb-jump-selector 'completing-read))

(use-package eros
  :ensure t
  :config
  (eros-mode 1))

;; tree sitter stuff ;)
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     ;; (clojure "https://github.com/sogaiu/tree-sitter-clojure")
     ;; (commonlisp "https://github.com/theHamsta/tree-sitter-commonlisp")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     ;; (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     ;; (elixir "https://github.com/elixir-lang/tree-sitter-elixir")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     ;; (html "https://github.com/tree-sitter/tree-sitter-html")
     (java "https://github.com/tree-sitter/tree-sitter-java")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     ;; (julia "https://github.com/tree-sitter/tree-sitter-julia")
     ;; (lua "https://github.com/Azganoth/tree-sitter-lua")
     ;; (make "https://github.com/alemuller/tree-sitter-make")
     ;; (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     ;; (protobuf "https://github.com/mitchellh/tree-sitter-proto")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (ruby "https://github.com/tree-sitter/tree-sitter-ruby")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")
     (zig "https://github.com/maxxnino/tree-sitter-zig")
     ))

(setq major-mode-remap-alist
      '((bash-mode . bash-ts-mode)
        (css-mode . css-ts-mode)
        ;; (clojure-mode . clojure-ts-mode)
        ;; (common-lisp-mode . commonlisp-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (cmake-mode . cmake-ts-mode)
        ;; (emacs-lisp-mode . elisp-ts-mode)
        ;; (elixir-mode . elixir-ts-mode)
        (go-mode . go-ts-mode)
        ;; (html-mode . html-ts-mode)
        (java-mode . java-ts-mode)
        (js2-mode . js-ts-mode)
        (js-json-mode . json-ts-mode)
        (json-mode . json-ts-mode)
        ;; (julia-mode . julia-ts-mode)
        ;; (lua-mode . lua-ts-mode)
        ;; (makefile-mode . makefile-ts-mode)
        ;; (markdown-mode . markdown-ts-mode)
        ;; (protobuf-mode . protobuf-ts-mode)
        (python-mode . python-ts-mode)
        (ruby-mode . ruby-ts-mode)
        ;; (rust-mode . rust-ts-mode)
        (conf-toml-mode . toml-ts-mode)
        (typescript-mode . typescript-ts-mode)
        (yaml-mode . yaml-ts-mode)
        ;; (zig-mode . zig-ts-mode)
        ))

;; TODO: schedule grammars update
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

;; languages
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
(require 'r-config)

;; conf/markup
;; (use-package jsonian
;;   :ensure nil
;;   :after so-long
;;   :custom
;;   (jsonian-no-so-long-mode))

(defun j2/init-json-mode ()
  (setq js-indent-level 2)
  (setq indent-tabs-mode nil)
  (setq json-encoding-default-indentation "  "))

(use-package json-mode
  :mode ("\\.json")
  :hook ((json-mode json-ts-mode) . j2/init-json-mode))

(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

(use-package markdown-mode
  :mode ("\\.text\\'" "\\.markdown\\'" "\\.md\\'"))

(use-package protobuf-mode
  :mode "\\.proto\\'")

(use-package capnp-mode
  :mode "\\.capnp\\'")

(use-package dockerfile-mode
  :defer t)

(use-package graphviz-dot-mode
  :defer t)

(use-package plantuml-mode
  :defer t
  :config
  (let ((plantuml-prefix (string-trim-right (shell-command-to-string "/opt/homebrew/bin/brew --prefix plantuml"))))
    (setq plantuml-jar-path (concat plantuml-prefix "/libexec/plantuml.jar")
          plantuml-default-exec-mode 'executable
          org-plantuml-executable-path (concat plantuml-prefix "/bin/plantuml")
          org-plantuml-exec-mode 'plantuml)))

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . prog-mode))

(use-package sqlite-mode-extras
  :ensure t
  :hook ((sqlite-mode . sqlite-extras-minor-mode)))

(provide 'init-lang)
;;; init-lang.el ends here
