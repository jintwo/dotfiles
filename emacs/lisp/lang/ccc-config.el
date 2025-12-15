;;; ccc-config.el --- c/c++/obj-c config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package cmake-mode
  :ensure t)

(use-package eldoc-cmake
  :ensure t)

(add-hook 'c-mode-hook #'j2/project-eglot-ensure)
(add-hook 'c-ts-mode-hook #'j2/project-eglot-ensure)

(add-hook 'c++-mode-hook #'j2/project-eglot-ensure)
(add-hook 'c++-ts-mode-hook #'j2/project-eglot-ensure)

(add-hook 'objc-mode-hook #'j2/project-eglot-ensure)
;; TODO: is there tree-sitter grammar for objc?

(provide 'ccc-config)
;;; ccc-config.el ends here
