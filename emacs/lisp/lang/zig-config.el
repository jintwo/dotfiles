;;; zig-config.el --- zig config
;;; Commentary:
;;; Code:
(use-package zig-mode
  :defer t
  :hook (zig-mode . j2/project-eglot-ensure))

(provide 'zig-config)
;;; zig-config.el ends here
