;;; init-ocaml.el --- Ocaml dev config
;;; Commentary:
;;; Code:
(use-package tuareg
  :ensure t
  :defer t
  :mode (("\\.mll\\'" . tuareg-mode)
         ("\\.mly\\'" . tuareg-menhir-mode)))

(use-package utop
  :ensure t)

(use-package flycheck-ocaml
  :ensure t)

(use-package merlin
  :ensure t
  :config
  (flycheck-ocaml-setup))

(add-hook 'tuareg-mode-hook #'utop-minor-mode)
(add-hook 'tuareg-mode-hook #'merlin-mode)

(add-hook 'tuareg-mode-hook (lambda ()
                              (progn
                                (define-key tuareg-mode-map (kbd "C-c C-s")
                                  'utop)
                                (setq compile-command
                                      "opam config exec corebuild "))))

(require 'company)
(add-to-list 'company-backends 'merlin-company-backend)

(setq utop-command "opam config exec utop -- -emacs"
      merlin-error-after-save nil)

(provide 'init-ocaml)
;;; init-ocaml.el ends here
