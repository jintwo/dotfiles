;;; init-lang.el --- other languages config  -*- lexical-binding: t; -*-
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
        dumb-jump-force-searcher 'rg
        dumb-jump-rg-search-args "--pcre2 --hidden"
        dumb-jump-selector 'completing-read
        dumb-jump-default-project "~"))

(use-package eros
  :ensure t
  :config
  (eros-mode 1))

;; code formatter
(use-package apheleia
  :ensure t
  :bind (:map prog-mode-map (("C-c e p" . apheleia-format-buffer))))

;; tree sitter stuff ;)
(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
        ;; base repo
        '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
          (css . ("https://github.com/tree-sitter/tree-sitter-css"))
          (c . ("https://github.com/tree-sitter/tree-sitter-c"))
          (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
          (go . ("https://github.com/tree-sitter/tree-sitter-go"))
          (html . ("https://github.com/tree-sitter/tree-sitter-html"))
          (java . ("https://github.com/tree-sitter/tree-sitter-java"))
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
          (json . ("https://github.com/tree-sitter/tree-sitter-json"))
          ;; (julia . ("https://github.com/tree-sitter/tree-sitter-julia"))
          ;; (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml")) ;; broken?
          (python . ("https://github.com/tree-sitter/tree-sitter-python"))
          ;; (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
          (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
          (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
          (tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src"))
          (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src"))

          ;; grammars repo
          (capnp . ("https://github.com/tree-sitter-grammars/tree-sitter-capnp"))
          (lua . ("https://github.com/tree-sitter-grammars/tree-sitter-lua"))
          (markdown . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown/src"))
          (markdown-inline . ("https://github.com/tree-sitter-grammars/tree-sitter-markdown" "split_parser" "tree-sitter-markdown-inline/src"))
          (make . ("https://github.com/tree-sitter-grammars/tree-sitter-make"))
          (yaml . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml"))
          (zig . ("https://github.com/tree-sitter-grammars/tree-sitter-zig"))

          ;; other
          (cmake . ("https://github.com/uyha/tree-sitter-cmake"))
          (gomod . ("https://github.com/camdencheek/tree-sitter-go-mod"))
          ;; (protobuf . ("https://github.com/coder3101/tree-sitter-proto"))
          (r . ("https://github.com/r-lib/tree-sitter-r"))
          ;; (swift . ("https://github.com/alex-pinkus/tree-sitter-swift"))  ;; generate parsr.c manually
          ;; (typst . ("https://github.com/uben0/tree-sitter-typst"))
          )

        treesit-auto-install-grammar 'always
        treesit-enabled-modes t
        treesit-font-lock-level 2))

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
        ;; (julia-mode . julia-ts-mode)
        (lua-mode . lua-ts-mode)
        (makefile-mode . makefile-ts-mode)
        (markdown-mode . markdown-ts-mode)
        ;; (protobuf-mode . protobuf-ts-mode)
        (python-mode . python-ts-mode)
        ;; (ruby-mode . ruby-ts-mode)
        (rust-mode . rust-ts-mode)
        ;; (swift-mode . swift-ts-mode)
        (conf-toml-mode . toml-ts-mode)
        (typescript-mode . typescript-ts-mode)))

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

(defun j2/init-json-mode ()
  (setq-local indent-tabs-mode nil)
  (setq-local json-encoding-default-indentation "  "))

(use-package json-ts-mode
  :mode (rx ".json" eos)
  :hook (json-ts-mode . j2/init-json-mode))

(defun j2/init-yaml-mode ()
  (display-line-numbers-mode t)
  (setq-local tab-width 2))

(use-package yaml-ts-mode
  :mode (rx ".y" (0+ "a") "ml" eos)
  :hook (yaml-ts-mode . j2/init-yaml-mode))

(use-package markdown-ts-mode
  :ensure nil
  :mode (rx ".md" eos))

(use-package markdown-ts-appear
  :vc ( :url "https://github.com/Thysrael/markdown-ts-appear"
        :rev :newest)
  :hook (markdown-ts-mode . markdown-ts-appear-mode)
  :config
  (setq markdown-ts-appear-code-fence-style 'raw))

(use-package protobuf-mode
  :mode (rx ".proto" eos))

(defun j2/init-capnp-mode ()
  (setq indent-tabs-mode nil)
  (setq tab-width 2))

(use-package capnp-mode
  :mode (rx ".capnp" eos)
  :hook (capnp-mode . j2/init-capnp-mode))

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

(add-to-list 'auto-mode-alist `(,(rx ".tpl" eos) . prog-mode))

(use-package sqlite-mode-extras
  :ensure t
  :hook ((sqlite-mode . sqlite-extras-minor-mode)))

(use-package gleam-ts-mode
  :mode (rx ".gleam" eos)
  :config
  (with-eval-after-load 'eglot
    (add-to-list 'eglot-server-programs
                 '(gleam-ts-mode . ("gleam" "lsp"))))
  (defun gleam-ts-before-save-hook ()
    (when (eq major-mode 'gleam-ts-mode)
      (gleam-ts-format)))
  (add-hook 'before-save-hook #'gleam-ts-before-save-hook))

(use-package elisp-mode
  :ensure nil
  :init
  (add-hook 'completion-at-point-functions #'elisp-completion-at-point))

(use-package typst-ts-mode
  :ensure t
  :mode (rx ".typ" eos))

(use-package mhtml-mode
  :hook ((mhtml-mode . (lambda () (local-unset-key (kbd "M-o"))))))

(use-package flymake
  :ensure t
  :pin gnu
  :config
  (setq flymake-diagnostic-format-alist
        '((t . (origin code message)))))

;; (use-package eldoc
;;   :ensure nil
;;   :defer t
;;   :config
;;   (setq eldoc-help-at-pt t
;;         eldoc-idle-delay 0.5
;;         eldoc-echo-area-prefer-doc-buffer t))

;; (use-package eldoc-box
;;   :bind ("C-h d" . eldoc-box-help-at-point))

(use-package gdscript-mode
  :ensure t)

(defun j2/mark-named-region (beg end)
  (interactive "r")
  (let ((name (read-from-minibuffer "Name: ")))
    (save-excursion
      (goto-char end)
      (unless (bolp)
        (insert "\n"))
      (deactivate-mark)
      (insert (format "--8<-- [end:%s]\n" name))
      (comment-line -1)
      (goto-char beg)
      (insert (format "--8<-- [start:%s]\n" name))
      (comment-line -1))))


(provide 'init-lang)
;;; init-lang.el ends here
