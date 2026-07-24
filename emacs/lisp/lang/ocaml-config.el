;;; ocaml-config.el --- ocaml config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(defcustom j2/use-ocaml-mode 'neocaml
  "Which major mode to use."
  :type '(choice (const :tag "use neocaml mode" neocaml)
                 (const :tag "use tuareg mode" tuareg)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `(tuareg-mode . ,(eglot-alternatives '(("ocamllsp" "--fallback-read-dot-merlin")))))
  (add-to-list 'eglot-server-programs
               `(neocaml-mode . ,(eglot-alternatives '(("ocamllsp" "--fallback-read-dot-merlin"))))))

(use-package neocaml
  :if (eq j2/use-ocaml-mode 'neocaml)
  :ensure t)

(use-package tuareg
  :if (eq j2/use-ocaml-mode 'tuareg)
  :ensure t
  :mode (((rx ".(mll|ml[ip]?|eliomi?)" eos) . tuareg-mode)
         ((rx ".mly" eos) . tuareg-menhir-mode)
         ((rx ".ocamlinit" eos) . tuareg-mode))
  :hook (tuareg-mode . j2/project-eglot-ensure))

(use-package ocaml-eglot
  :ensure t
  :hook
  (tuareg-mode . ocaml-eglot)
  (neocaml-mode . ocaml-eglot)
  (ocaml-eglot . eglot-ensure)
  (ocaml-eglot . (lambda ()
                   (add-hook #'before-save-hook #'eglot-format nil t)))
  :config
  (setq ocaml-eglot-syntax-checker 'flymake))

(when (eq j2/use-ocaml-mode 'tuareg)
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
    (setq utop-command "opam exec -- dune utop . -- -emacs")))

(provide 'ocaml-config)
;;; ocaml-config.el ends here
