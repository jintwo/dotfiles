;;; init-ibuffer.el --- ibuffer config
;;; Commentary:
;;; Code:
(use-package ibuffer-vc
  :ensure t
  :init
  (setq ibuffer-formats
      '((mark modified read-only vc-status-mini " "
              (name 18 18 :left :elide)
              " "
              (size 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " "
              filename-and-process))
      ibuffer-show-empty-filter-groups nil
      ibuffer-expert t)
  :bind ("C-x C-b" . ibuffer)
  :config
  (defun ibuffer-init ()
    (ibuffer-auto-mode 1)
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic)))
  (add-hook 'ibuffer-mode-hook 'ibuffer-init))

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
