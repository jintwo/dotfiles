;;; init-ibuffer.el --- ibuffer config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package ibuffer-project
  :defer t)

(defun ibuffer-set-up-preferred-filters ()
  (setq ibuffer-filter-groups (ibuffer-project-generate-filter-groups))
  (unless (eq ibuffer-sorting-mode 'project-file-relative)
    (ibuffer-do-sort-by-project-file-relative)))

(add-hook 'ibuffer-hook 'ibuffer-set-up-preferred-filters)

(setq-default ibuffer-show-empty-filter-groups nil)

(with-eval-after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(setq ibuffer-formats
      '((mark modified read-only locked " "
              (name 22 22 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 12 12 :left :elide)
              " "
              project-file-relative)))

(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

(keymap-global-set "C-x C-b" 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
