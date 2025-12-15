;;; swift-config.el --- swift config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package swift-mode
  :defer t
  :hook (swift-mode . j2/project-eglot-ensure))

(provide 'swift-config)
;;; swift-config.el ends here
