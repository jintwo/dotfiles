;;; zig-config.el --- zig config
;;; Commentary:
;;; Code:
(use-package zig-mode
  :defer t)

(when (featurep 'init-eglot)
  (add-hook 'zig-mode-hook #'eglot-ensure))

(provide 'zig-config)
;;; zig-config.el ends here
