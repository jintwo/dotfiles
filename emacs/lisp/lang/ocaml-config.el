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
  :hook ((tuareg-mode caml-mode) . merlin-mode)
  :config (setq merlin-error-after-save nil))

(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))

(when (featurep 'init-eglot)
  (put 'tuareg-mode 'eglot-language-id "ocaml")
  (put 'tuareg-opam-mode 'eglot-language-id "ocaml")
  (put 'merlin-mode 'eglot-language-id "ocaml"))

(provide 'ocaml-config)
;;; ocaml-config.el ends here
