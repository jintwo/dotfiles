;;; init-corfu.el
;;; Commentary:
;;; Code:
(use-package corfu
  :ensure t
  ;; TAB-and-Go customizations
  :custom
  (corfu-cycle t)             ;; Enable cycling for `corfu-next/previous'
  (corfu-preselect-first nil) ;; Disable candidate preselection
  (corfu-count 7)
  (corfu-min-width 20)
  (corfu-preview-current 'insert)
  (corfu-scroll-margin 1)
  (corfu-echo-documentation t)
  (corfu-bar-width 1)
  (corfu-right-margin-width 0.5)
  (corfu-left-margin-width 0.5)

  ;; Use TAB for cycling, default is `corfu-complete'.
  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator)
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous)
        ([remap completion-at-point] . corfu-complete)
        ("M-q" . corfu-quick-jump))

  :config
  (defun corfu-move-to-minibuffer ()
    (interactive)
    (let ((completion-extra-properties corfu--extra)
          completion-cycle-threshold completion-cycling)
      (apply #'consult-completion-in-region completion-in-region--data)))
  (define-key corfu-map "\M-m" #'corfu-move-to-minibuffer)

  :init
  (global-corfu-mode))

(use-package corfu-terminal
  :ensure t
  :config
  (corfu-terminal-mode +1))

(use-package corfu-candidate-overlay
  :ensure t
  :config
  (corfu-candidate-overlay-mode +1)
  (global-set-key (kbd "C-<tab>") 'completion-at-point)
  (global-set-key (kbd "C-S-<tab>") 'corfu-candidate-overlay-complete-at-point))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-use-icons nil)
  (kind-icon-blend-background nil)
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
;;; init-corfu.el ends here
