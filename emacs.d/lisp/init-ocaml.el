;;; init-ocaml.el --- Ocaml dev config
;;; Commentary:
;;; Code:
(use-package tuareg
  :ensure t
  :defer t
  :mode (("\\.mll\\'" . tuareg-mode)
         ("\\.mly\\'" . tuareg-menhir-mode)))

(use-package merlin
  :requires tuareg
  :config
  (add-hook 'caml-mode-hook 'merlin-mode))

(provide 'init-ocaml)
;;; init-ocaml.el ends here
