;;; kaoless-theme.el --- kao colorless theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'less-themer)

(deftheme kaoless "j2/kaoless using less-themer.el")

(eval-and-compile
  (defvar kaoless-colors-alist
    '((bg . "#F5F6F5")
      (bg+ . "#F1F3E9")
      (current-line . "#E5E6DE")
      (fade . "#C3C4BF")
      (fg . "#4E4757")
      (fg+ . "#CA6036")
      (docs . "#5B7C93") ;; cyan
      (red . "#CD5C60")
      (warning . "#C5882C")
      (yellow . "#D1832E")
      (green . "#4D8B5B")
      (blue . "#81A1C1"))
    "kaoless kolors"))

(make-less-theme 'kaoless kaoless-colors-alist)

(provide-theme 'kaoless)

(provide 'kaoless-theme)
;;; kaoless-theme.el ends here
