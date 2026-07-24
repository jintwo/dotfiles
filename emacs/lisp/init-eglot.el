;;; init-eglot.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package eglot
  :bind (:map prog-mode-map (("C-c e r" . eglot-rename)))
  :config
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))
  (setq eglot-code-action-indicator "*")
  ;; (setq eglot-code-action-indications nil) ;; emacs31
  ;; (setq eglot-documentation-renderer 'markdown-ts-view-mode) ;; emacs31
  )

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
