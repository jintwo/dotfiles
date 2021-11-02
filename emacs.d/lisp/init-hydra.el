;;; init-hydra.el --- hydra config
;;; Commentary:
;;; Code:
(use-package hydra)

(defhydra hydra-zoom ()
  "Zoom"
  ("+" text-scale-increase "In")
  ("-" text-scale-decrease "Out")
  ("0" (text-scale-adjust 0) "Reset")
  ("q" nil "Quit" :color blue))

(global-set-key (kbd "C-c z") 'hydra-zoom/body)


(defhydra hydra-flycheck ()
  "Flycheck errors"
  ("n" #'flycheck-next-error "Next")
  ("p" #'flycheck-previous-error "Previous")
  ("q" nil "Quit" :color blue))

(global-set-key (kbd "C-c c") 'hydra-flycheck/body)

(defhydra hydra-smartparens ()
  "Smartparens"
  ("d" sp-down-sexp "Down")
  ("e" sp-up-sexp "Up")
  ("u" sp-backward-up-sexp "Up")
  ("a" sp-backward-down-sexp "Down")
  ("f" sp-forward-sexp "Forward")
  ("b" sp-backward-sexp "Backward")
  ("k" sp-kill-sexp "Kill" :color blue)
  ("q" nil "Quit" :color blue))

(bind-key "C-M-s" 'hydra-smartparens smartparens-mode-map)


(provide 'init-hydra)
;;; init-hydra.el ends here
