;;; init-helm.el --- helm config
;;; Commentary:
;;; Code:
(use-package helm
  :bind (("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring)
         ("C-x b" . helm-mini)
         ("C-x C-f" . helm-find-files)
         ("C-x C-r" . helm-recentf))
  :init
  (setq completion-styles `(flex))
  :custom
  (helm-command-prefix-key "C-c h")
  (helm-completion-style 'emacs)
  (helm-split-window-inside-p t)
  (helm-display-header-line nil)
  (helm-display-buffer-default-height 20)
  (helm-autoresize-mode 1)
  (helm-autoresize-min-height 20)
  (helm-autoresize-max-height 20))

;; outdated
(use-package helm-flx)

(use-package helm-swoop
  :bind (("M-i" . helm-swoop)
         ("M-I" . helm-swoop-back-to-last-point)))

(use-package helm-xref
  :defer 0
  :config
  (setq xref-prompt-for-identifier '(not xref-find-definitions
                                         xref-find-definitions-other-window
                                         xref-find-definitions-other-frame
                                         xref-find-references)
        xref-show-xrefs-function #'helm-xref-show-xrefs-27))

(provide 'init-helm)
;;; init-helm.el ends here
