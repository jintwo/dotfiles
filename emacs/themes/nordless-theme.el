;;; nordless-theme.el --- nord colorless theme -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'less-themer)

(deftheme nordless "j2/nordless using less-themer.el")

(eval-and-compile
  (defvar nordless-colors-alist
    '((bg . "#2E3440")
      (bg+ . "#3B4252")
      (current-line . "#434C5E")
      (fade . "#4C566A")
      (fg . "#D8DEE9")
      ;; (fg+ . "#E5E9F0") ;; original
      (fg+ . "#ECEFF4")
      (docs . "#88C0D0") ;; cyan
      (red . "#BF616A")
      (warning . "#D08770")
      (yellow . "#EBCB8B")
      (green . "#A3BE8C")
      (blue . "#81A1C1"))
    "nordless nolors"))

(make-less-theme 'nordless nordless-colors-alist)

(provide-theme 'nordless)

(provide 'nordless-theme)
;;; nordless-theme.el ends here
