;;; init-vendor.el --- init vendor modules
;;; Commentary:
;;; Code:
;; utils
;; (use-package i-ching
;;   :load-path "vendor/i-ching")

;; langs
;; (use-package chuck-mode
;;   :load-path "vendor/chuck-mode"
;;   :custom
;;   (chuck-exec "/usr/local/bin/chuck")
;;   (chuck-port 9191))

(use-package clipr-mode
  :load-path "vendor/clipr-mode"
  :bind (:map global-map (("C-c u c" . clipr-show)))
  :custom
  (clipr-config-path "/Users/jin/Documents/dev/projects/clipr/config.toml"))

(provide 'init-vendor)
;;; init-vendor.el ends here
