;;; zig-config.el --- zig config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package zig-ts-mode
  :mode (rx ".zig" eos)
  :hook (zig-ts-mode . j2/project-eglot-ensure))

(provide 'zig-config)
;;; zig-config.el ends here
