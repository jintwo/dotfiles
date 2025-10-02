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

(with-eval-after-load 'ibuffer
  ;; Use human readable Size column instead of original one
  (define-ibuffer-column size-h
    (:name "Size" :inline t)
    (file-size-human-readable (buffer-size))))

(setq ibuffer-formats
      '((mark modified read-only locked " "
              (name 30 30 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              project-file-relative
              ;; filename-and-process
              )
        (mark " "
              (name 16 -1)
              " " filename)))
(setq ibuffer-use-header-line t)
(setq ibuffer-default-shrink-to-minimum-size nil)
(setq ibuffer-display-summary nil)
(setq ibuffer-use-other-window nil)
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-title-face 'bold)
(setq ibuffer-filter-group-name-face 'font-lock-doc-face)

(keymap-global-set "C-x C-b" 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
