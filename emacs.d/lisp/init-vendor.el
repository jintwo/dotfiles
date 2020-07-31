;;; init-vendor.el --- init vendor modules
;;; Commentary:
;;; Code:
;; utils
(use-package i-ching
  :ensure t
  :load-path "vendor/i-ching")

;; langs
(use-package chuck-mode
  :ensure t
  :load-path "vendor/chuck-mode"
  :custom
  (chuck-exec "/usr/local/bin/chuck")
  (chuck-port 9191))

(use-package sclang
  :ensure t
  :load-path "vendor/sclang"
  :config
  (use-package sclang-extensions
    :ensure t))

(provide 'init-vendor)
;;; init-vendor.el ends here
