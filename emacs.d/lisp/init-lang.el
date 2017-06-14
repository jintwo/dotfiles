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
(jin/require-package 'irony 'cmake-mode 'company-irony)
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

;; js
(jin/require-package 'js2-mode)
(jin/add-auto-mode 'js2-jsx-mode "\\.js\\'" "\\.jsx\\'")

;; disabled:
;; 'tuareg-mode 'merlin 'rust-mode 'sml-mode 'elm-mode
(jin/require-package 'yaml-mode 'swift-mode 'protobuf-mode 'web-mode 'dockerfile-mode)

(jin/add-auto-mode 'web-mode "\\.html\\'")

;; indent
(setq-default
 indent-tabs-mode nil
 tab-width 4
 c-default-style "linux"
 c-basic-offset 4)

(provide 'init-lang)
;;; init-lang.el ends here
