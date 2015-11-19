;;; init-ibuffer.el --- ibuffer config
;;; Commentary:
;;; Code:
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("C"
                (or
                 (mode . c-mode)
                 (mode . objc-mode)
                 (mode . c++-mode)))
               ("Go"
                (or
                 (mode . go-mode)))
               ("Python"
                (or
                 (mode . python-mode)))
               ("Haskell"
                (or
                 (mode . haskell-mode)))
               ("Clojure"
                (or
                 (mode . clojure-mode)))
               ("Version Control"
                (or
                 (mode . magit-mode)
                 (name . "^*magit")))
               ("Dired"
                (or
                 (mode . dired-mode)))))))

(jin/require-package 'ibuffer-vc)

(add-hook 'ibuffer-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")
    (ibuffer-vc-set-filter-groups-by-vc-root)
    (unless (eq ibuffer-sorting-mode 'alphabetic)
      (ibuffer-do-sort-by-alphabetic))))

(setq ibuffer-formats '((mark modified read-only vc-status-mini " "
                              (name 18 18 :left :elide)
                              " "
                              (size 9 -1 :right)
                              " "
                              (mode 16 16 :left :elide)
                              " "
                              (vc-status 16 16 :left)
                              " "
                              filename-and-process)))

(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-ibuffer)
;;; init-ibuffer.el ends here
