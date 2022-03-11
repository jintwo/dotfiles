;;; kaoless-new-theme.el --- custom themes
;;; Commentary:
;;; Code:

;; -*- lexical-binding: t -*-
(require 'colorless-themes)

(deftheme kaoless-new "kaolin light colorless (new)")

(colorless-themes-make kaoless-new
                       "#f5f6f5" ;; bg
                       "#F1F3E9" ;; bg+
                       "#E5E6DE" ;; current-line
                       "#C3C4BF" ;; fade
                       "#4E4757" ;; fg
                       "#ca6036" ;; fg+
                       "#5B7C93" ;; docs
                       "#cd5c60" ;; red
                       "#C5882C" ;; warning
                       "#d1832e" ;; yellow
                       "#4D8B5B" ;; green
                       )

(provide-theme 'kaoless-new)

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'kaoless-new-theme)
;;; kaoless-new-theme.el ends here
