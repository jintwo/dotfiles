;;; init-ocaml.el --- Ocaml dev config
;;; Commentary:
;;; Code:
(use-package tuareg
  :mode (("\\.mll\\'" . tuareg-mode)
         ("\\.ml[ip]?\\'" . tuareg-mode)
         ("\\.eliomi?\\'" . tuareg-mode)
         ("\\.mly\\'" . tuareg-menhir-mode)))

(use-package utop
  :after tuareg
  :config
  (setq utop-command "opam config exec utop -- -emacs")
  (add-hook 'tuareg-mode-hook #'utop-minor-mode))

(use-package flycheck-ocaml
  :after tuareg)

(use-package merlin
  :after (tuareg flycheck-ocaml)
  :config
  (flycheck-ocaml-setup)
  (setq merlin-error-after-save nil)
  (add-hook 'tuareg-mode-hook #'merlin-mode))

(add-hook 'tuareg-mode-hook (lambda ()
                              (progn
                                (define-key tuareg-mode-map (kbd "C-c C-s")
                                  'utop)
                                (setq compile-command
                                      "opam config exec corebuild "))))

(require 'company)
(add-to-list 'company-backends 'merlin-company-backend)

(provide 'init-ocaml)
;;; init-ocaml.el ends here
