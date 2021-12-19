;;; ccc.el --- c/c++/obj-c config
;;; Commentary:
;;; Code:
(defun add-c-modes-hook (function)
  (dolist (mode '(c-mode-hook
                  c++-mode-hook
                  objc-mode-hook))
    (add-hook mode function)))

(when (featurep 'init-lsp)
  (use-package ccls
    :defer t
    :config
    (add-c-modes-hook #'lsp-deferred)))

(when (featurep 'init-eglot)
  (add-c-modes-hook #'eglot-ensure))

(defun clang-format-on-save ()
  (add-hook 'before-save-hook #'clang-format-buffer nil t))

(use-package clang-format
  :defer t
  :config
  (setq clang-format-style "file")
  (add-c-modes-hook #'clang-format-on-save))

(provide 'lang/ccc)
;;; ccc.el ends here
