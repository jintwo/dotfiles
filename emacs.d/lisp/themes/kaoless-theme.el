;;; kaoless-theme.el --- custom themes
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-
(require 'colorless-themes)

(deftheme kaoless "kaolin light colorless")

(colorless-themes-make kaoless
                       "#F1F3E9"    ; bg
                       "#E5E6DE"    ; bg+
                       "#DEE0D6"    ; current-line
                       "#C3C4BF" ;; "#DCDED2"    ; fade

                       "#575160" ;; "#534C5B"    ; fg
                       "#928E93" ;; "#575160"    ; fg+
                       "#838A70"    ; docs

                       "#E76282" ;; "#BF616A"    ; red (e76282)
                       "#D1832E" ;; "#D08770"    ; orange (379045)
                       "#EBCB8B"    ; yellow
                       "#4D8B5B") ;; "#A3BE8C"   ; green (4d8b5b)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'kaoless)

(provide 'kaoless-theme)

;;; kaoless-theme.el ends here
