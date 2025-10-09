;;; ocaml-config.el --- ocaml config
;;; Commentary:
;;; Code:
(use-package tuareg
  :ensure t
  :mode (((rx ".(mll|ml[ip]?|eliomi?)" eos) . tuareg-mode)
         ((rx ".mly" eos) . tuareg-menhir-mode))
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

(use-package opam-switch-mode
  :ensure t
  :hook
  ((coq-mode tuareg-mode) . opam-switch-mode))

(use-package dune
  :ensure t)

(use-package utop
  :ensure t
  :hook (tuareg-mode . utop-minor-mode)
  :config
  (setq utop-command "opam exec -- dune utop . -- -emacs"))

(provide 'ocaml-config)
;;; ocaml-config.el ends here
