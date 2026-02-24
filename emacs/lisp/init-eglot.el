;;; init-eglot.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package eglot
  :bind (:map prog-mode-map (("C-c e r" . eglot-rename)))
  :hook ((eglot-managed-mode . manually-activate-flymake))
  :config
  (setq eglot-ignored-server-capabilites '(:inlayHintProvider))
  (setq eglot-code-action-indicator "*")
  (add-to-list 'eglot-stay-out-of 'flymake))

(defun manually-activate-flymake ()
  (add-hook 'flymake-diagnostic-functions #'eglot-flymake-backend nil t)
  (flymake-mode t))

(when (featurep 'consult-eglot)
  (add-hook 'prog-mode-hook
            (lambda () (keymap-local-set "C-c e j" 'consult-eglot-symbols))))

(defun j2/project-eglot-ensure ()
  (interactive)
  (when (project-current)
    (eglot-ensure)))

;; stolen from: https://codeberg.org/TristanCacqueray/dot-files/src/branch/master/emacs/.config/emacs/lisp/mr-dev.el
(fset #'jsonrpc--log-event #'ignore)

(provide 'init-eglot)
;;; init-eglot.el ends here
