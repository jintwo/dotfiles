;;; ocaml.el --- ocaml config
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

(when (featurep 'init-flycheck)
  (use-package flycheck-ocaml
    :after tuareg)

  (use-package merlin
    :after (tuareg flycheck-ocaml)
    :config
    (flycheck-ocaml-setup)
    (setq merlin-error-after-save nil)
    (add-hook 'tuareg-mode-hook #'merlin-mode)

    (require 'company)
    (add-to-list 'company-backends 'merlin-company-backend)))

(add-hook 'tuareg-mode-hook (lambda ()
                              (progn
                                (define-key tuareg-mode-map (kbd "C-c C-s")
                                  'utop)
                                (setq compile-command
                                      "opam config exec corebuild "))))

(provide 'lang/ocaml)
;;; ocaml.el ends here
