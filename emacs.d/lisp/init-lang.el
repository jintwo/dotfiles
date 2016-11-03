;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
;; json
(jin/require-package 'json-reformat 'json-mode)
(jin/add-auto-mode 'json-mode "\\.json\\'" "\\.avsc\\'")

(defun large-file-hook ()
  "If a file is over a given size, make the buffer read only."
  (when (> (buffer-size) (* 300 1024))
    (setq buffer-read-only t)
    (buffer-disable-undo)
    (fundamental-mode)))

(add-hook 'find-file-hook 'large-file-hook)

;; erlang + elixir
(jin/require-package 'erlang 'elixir-mode 'alchemist)
(jin/add-auto-mode 'erlang-mode "\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'")
(require 'alchemist)

;; c/c++
(jin/require-package 'irony 'cmake-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(require 'irony)
(defun irony-mode-hook ()
  "C/C++ mode hook."
  (define-key
    irony-mode-map
    [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key
    irony-mode-map
    [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(push 'company-irony company-backends)

;; conf
(add-hook 'conf-mode-hook
          (lambda () (setq tab-width 4)))

;; llvm
(jin/require-package 'llvm-mode)

;; js
;; (jin/require-package 'tern)
;; (add-hook 'js-mode-hook 'tern-mode)
;; (push 'company-tern company-backends)

;; ;; ruby
;; (jin/require-package 'robe)
;; (add-hook 'ruby-mode-hook 'robe-mode)
;; (push 'company-robe company-backends)

;; other
;; vendor libs
;; (require 'crystal-mode)
;; (require 'ooc-mode)
;; (require 'flymake-ooc)

;; disabled:
;; 'malabar-mode 'tuareg-mode 'merlin 'd-mode 'rust-mode
;; 'toml-mode 'nim-mode 'julia-mode 'dtrace-script-mode
;; 'groovy-mode 'gradle-mode 'sml-mode
(jin/require-package 'yaml-mode 'swift-mode 'protobuf-mode
                     'web-mode 'elm-mode 'dockerfile-mode 'js2-mode)

(jin/add-auto-mode 'web-mode "\\.html\\'")
(jin/add-auto-mode 'dtrace-script-mode "\\.d\\'")
(jin/add-auto-mode 'js2-jsx-mode "\\.js\\'")

;; indent
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-default-style "linux"
 c-basic-offset 4)

(provide 'init-lang)
;;; init-lang.el ends here
