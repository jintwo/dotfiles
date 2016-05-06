;;; init-lang.el --- other languages config
;;; Commentary:
;;; Code:
;; json
(jin/require-package 'json-reformat)

;; avro
(jin/add-auto-mode 'javascript-mode "\\.avsc\\'")

;; js
(add-hook 'js-mode-hook 'tern-mode)
(push 'company-tern company-backends)

;; erlang + elixir
(jin/require-package 'erlang 'elixir-mode 'alchemist)
(jin/add-auto-mode 'erlang-mode "\\.erl\\'" "\\.hrl\\'" "rebar\\.config\\'")
(require 'alchemist)

;; ruby
(defalias 'ruby-mode 'enh-ruby-mode)
(push 'company-robe company-backends)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

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

;; other
;; disabled: 'malabar-mode 'tuareg-mode 'merlin 'd-mode
(require 'crystal-mode)
(require 'ooc-mode)
(require 'flymake-ooc)

(jin/require-package 'yaml-mode 'rust-mode 'toml-mode
                     'swift-mode 'protobuf-mode 'groovy-mode
                     'gradle-mode 'nim-mode 'julia-mode
                     'web-mode 'dtrace-script-mode)

(jin/add-auto-mode 'web-mode "\\.html\\'")
(jin/add-auto-mode 'dtrace-script-mode "\\.d\\'")

;; indent
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-default-style "linux"
 c-basic-offset 4)

(provide 'init-lang)
;;; init-lang.el ends here
