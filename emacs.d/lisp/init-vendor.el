;;; init-vendor.el --- init vendor modules
;;; Commentary:
;;; Code:
;; utils
(use-package i-ching
  :load-path "vendor/i-ching")

;; langs
(use-package chuck-mode
  :load-path "vendor/chuck-mode"
  :custom
  (chuck-exec "/usr/local/bin/chuck")
  (chuck-port 9191))

(use-package sclang
  :load-path "vendor/sclang")

(provide 'init-vendor)
;;; init-vendor.el ends here
