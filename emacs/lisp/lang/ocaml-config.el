;;; ocaml-config.el --- ocaml config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(caml-mode . ,(eglot-alternatives '(("ocamllsp" "--fallback-read-dot-merlin")))))
  (add-to-list 'eglot-server-programs
               `(ocaml-ts-mode . ,(eglot-alternatives '(("ocamllsp" "--fallback-read-dot-merlin")))))
  (add-to-list 'eglot-server-programs
               `(tuareg-mode . ,(eglot-alternatives '(("ocamllsp" "--fallback-read-dot-merlin"))))))

(use-package tuareg
  :ensure t
  :mode (((rx ".(mll|ml[ip]?|eliomi?)" eos) . tuareg-mode)
         ((rx ".mly" eos) . tuareg-menhir-mode)
         ((rx ".ocamlinit" eos) . tuareg-mode))
  :hook (tuareg-mode . j2/project-eglot-ensure))

(use-package ocaml-eglot
  :ensure t
  :after tuareg
  :hook
  (tuareg-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  (ocaml-eglot . (lambda ()
                   (add-hook #'before-save-hook #'eglot-format nil t)))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

(use-package dune
  :ensure t)

(use-package opam-switch-mode
  :ensure t
  :hook
  ((coq-mode tuareg-mode) . opam-switch-mode))

(use-package ocp-indent
  :ensure t
  :config
  (add-hook 'ocaml-eglot-hook 'ocp-setup-indent))

(use-package utop
  :ensure t
  :hook (tuareg-mode . utop-minor-mode)
  :config
  (setq utop-command "opam exec -- dune utop . -- -emacs"))

(provide 'ocaml-config)
;;; ocaml-config.el ends here
