;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
;; json+yaml
(use-package json-mode
  :ensure t
  :init (setq js-indent-level 2)
  :mode ("\\.json\\'" "\\.avsc\\'")
  :config
  (use-package json-reformat
    :after json-mode)
  (use-package yaml-mode
    :after json-mode))

;; erlang
(use-package erlang
  :ensure t
  :mode ("\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'"))

(use-package elixir-mode
  :ensure t
  :mode ("\\.ex\\'" "\\.exs\\'")
  :config
  (use-package alchemist
    :defer 1
    :after elixir-mode
    :bind (("C-c ." . alchemist-goto-definition-at-point)
           ("C-c ," . alchemist-goto-jump-back))))
;; c
(use-package irony
  :ensure t
  :config
  (use-package company-irony
    :after irony
    :config
    (defun irony-mode-init ()
      (define-key irony-mode-map [remap completion-at-point] 'irony-completion-at-point-async)
      (define-key irony-mode-map [remap complete-symbol] 'irony-completion-at-point-async))
    (add-hook 'irony-mode-hook 'irony-mode-init)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (push 'company-irony company-backends))
  (use-package cmake-mode
    :after irony)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode))

;; conf
(add-hook 'conf-mode-hook (lambda () (setq tab-width 4)))

;; js
(use-package js2-mode
  :mode (("\\.js\\'" . js2-jsx-mode)
         ("\\.jsx\\'" . js2-jsx-mode)))

;; swift
(use-package swift-mode
  :ensure t
  :config
  (use-package company-sourcekit
    :after swift-mode
    :config
    (push 'company-sourcekit company-backends)))

;; disabled:
;; 'sml-mode 'elm-mode

(use-package rust-mode
  :ensure t
  :config
  (use-package cargo
    :ensure t
    :bind (("C-c C-r" . cargo-process-run)
           ("C-c C-b" . cargo-process-build)))
  (with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package chuck-mode)

(use-package sclang
  :config
  (use-package sclang-extensions))

(use-package protobuf-mode)

(use-package dockerfile-mode)

;; caml
(use-package tuareg
  :ensure t
  :mode (("\\.mll\\'" . tuareg-mode)
         ("\\.mly\\'" . tuareg-menhir-mode))
  :config
  (use-package merlin
    :after tuareg
    :config
    (add-hook 'caml-mode-hook 'merlin-mode)))

;; web
(use-package web-mode
  :ensure t
  :mode "\\.html\\'")

;; prolog
(add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
(add-to-list 'auto-mode-alist '("\\.plt\\'" . prolog-mode))

;; indent
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-default-style "linux")

;; parens
(show-paren-mode 1)
(require 'paren)
(setq show-paren-delay 0)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-attribute 'show-paren-match nil :weight 'ultra-bold :underline t)

(provide 'init-lang)
;;; init-lang.el ends here
