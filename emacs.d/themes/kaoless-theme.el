;;; kaoless-theme.el --- custom themes
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-
(require 'colorless-themes)

(deftheme kaoless "kaolin light colorless (old)")

(colorless-themes-make kaoless
                       "#F1F3E9" ;; bg
                       "#E8EADA" ;; bg+
                       "#DEE0D6" ;; current-line
                       "#C3C4BF" ;; fade
                       "#534C5B" ;; fg
                       "#928E93" ;; fg+
                       "#5B7C93" ;; docs
                       "#E76282" ;; red
                       "#D1832E" ;; warning
                       "#EBCB8B" ;; yellow
                       "#4D8B5B" ;; green
                       )

(provide-theme 'kaoless)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'kaoless-theme)
;;; kaoless-theme.el ends here
