;;; sc-config.el --- supercollider config
;;; Commentary:
;;; Code:

;; add sclang to $PATH
(setq exec-path (append exec-path '("/Applications/SuperCollider.app/Contents/MacOS/")))

;; load provided library
(add-to-list 'load-path (f-join (getenv "HOME")
                                "Library/Application Support/SuperCollider/downloaded-quarks/scel/el"))
(require 'sclang)

(provide 'sc-config)
;;; sc-config.el ends here
