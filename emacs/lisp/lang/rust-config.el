;;; rust-config.el --- rust config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               `((rust-mode rust-ts-mode) . ("rust-analyzer"
                                             :initializationOptions ( :cargo ( :features "all"
                                                                               :buildScripts (:enable t))
                                                                      :procMacro ( :attributes (:enable t)
                                                                                   :enable t))))))

(use-package rust-mode
  :mode (rx ".rs" eos)
  :hook ((rust-mode rust-ts-mode) . j2/project-eglot-ensure)
  :custom (rust-format-on-save t))

;; (use-package flymake-clippy
;;   :hook ((rust-mode rust-ts-mode) . (lambda () (add-hook 'eglot-managed-mode-hook  #'flymake-clippy-setup))))

(provide 'rust-config)
;;; rust-config.el ends here
