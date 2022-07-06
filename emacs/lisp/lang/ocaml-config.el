;;; ocaml-config.el --- ocaml config
;;; Commentary:
;;; Code:

;;; TODO: consider moving to simple (probably) caml-mode
(use-package tuareg
  :mode (("\\.mll\\'" . tuareg-mode)
         ("\\.ml[ip]?\\'" . tuareg-mode)
         ("\\.eliomi?\\'" . tuareg-mode)
         ("\\.mly\\'" . tuareg-menhir-mode)))

(use-package merlin
  :defer t
  :config
  (setq merlin-error-after-save nil)
  (add-hook 'tuareg-mode-hook #'merlin-mode)
  (add-hook 'caml-mode-hook #'merlin-mode))

(when (featurep 'init-eglot)
  (put 'tuareg-mode 'eglot-language-id "ocaml")
  (put 'tuareg-opam-mode 'eglot-language-id "ocaml")
  (put 'merlin-mode 'eglot-language-id "ocaml"))

(provide 'ocaml-config)
;;; ocaml-config.el ends here
