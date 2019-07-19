;;; init-hydra.el --- hydra config
;;; Commentary:
;;; Code:
(use-package hydra)

(defhydra hydra-zoom ()
  "zoom"
  ("+" text-scale-increase "In")
  ("-" text-scale-decrease "Out")
  ("0" (text-scale-adjust 0) "Reset")
  ("q" nil "Quit" :color blue))

(global-set-key (kbd "C-c z") 'hydra-zoom/body)

(provide 'init-hydra)
;;; init-hydra.el ends here
