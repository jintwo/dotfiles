;;; zig-config.el --- zig config
;;; Commentary:
;;; Code:
(use-package zig-mode
  :defer t
  :hook (zig-mode-hook . j2/project-eglot-ensure))

(provide 'zig-config)
;;; zig-config.el ends here
