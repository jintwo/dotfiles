;;; zig-config.el --- zig config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; quite long time w/o updates
(use-package zig-ts-mode
  :mode (rx ".zig" eos)
  :hook (zig-ts-mode . j2/project-eglot-ensure))

;; (use-package zig-mode
;;   :hook (zig-mode . j2/project-eglot-ensure))

(provide 'zig-config)
;;; zig-config.el ends here
