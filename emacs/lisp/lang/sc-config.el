;;; sc-config.el --- supercollider config  -*- lexical-binding: t; -*-
;;; Commentary: only works on macos
;;; Code:
(if (not (eq (window-system) 'x))
    (progn
      (require 'f)
      (defconst sclang-path "/Applications/SuperCollider.app/Contents/MacOS")
      (defconst scel-path (f-join (getenv "HOME") "Library/Application Support/SuperCollider/downloaded-quarks/scel/el"))
      (when (file-directory-p sclang-path)
        ;; add sclang to $PATH
        (add-to-list 'exec-path sclang-path)
        ;; load provided library
        (add-to-list 'load-path scel-path)
        (require 'sclang))))

(provide 'sc-config)
;;; sc-config.el ends here
