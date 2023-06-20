;;; sc-config.el --- supercollider config
;;; Commentary:
;;; Code:
(defconst sclang-path "/Applications/SuperCollider.app/Contents/MacOS")
(defconst scel-path (f-join (getenv "HOME") "Library/Application Support/SuperCollider/downloaded-quarks/scel/el"))

(when (file-directory-p sclang-path)
  ;; add sclang to $PATH
  (add-to-list 'exec-path sclang-path)
  ;; load provided library
  (add-to-list 'load-path scel-path)
  (require 'sclang))

(provide 'sc-config)
;;; sc-config.el ends here
