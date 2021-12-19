;;; kaoless-theme.el --- custom themes
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-
(require 'colorless-themes)

(deftheme kaoless "kaolin light colorless")

(colorless-themes-make kaoless
                       "#F1F3E9"    ; bg
                       "#E8EADA" ;;"#ECEDDE" ;;"#E8E9D1" ;; "#E5E6DE"    ; bg+ ; string background
                       "#DEE0D6"    ; current-line
                       "#C3C4BF" ;; "#DCDED2"    ; fade ; mode-line + popup background selected

                       "#534C5B" ;; "#575160" ;; "#534C5B"    ; fg / default text

                       "#928E93" ;; "#575160"    ; fg+ / popup background unselected
                       "#5B7C93" ;; "#4A873A" ;; "#377E24" ;; "#6FAA3C" ;; "#838A70"    ; docs / comment -> make _more_ green, steal from orig theme

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
