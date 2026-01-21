;;; init-corfu.el  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package corfu
  :ensure t

  ;; TAB-and-Go customizations
  :custom
  (corfu-cycle t)             ;; Enable cycling for `corfu-next/previous'
  (corfu-preselect 'prompt) ;; Always preselect the prompt
  (corfu-echo-mode t)
  (corfu-popupinfo-mode t)

  ;; Use TAB for cycling, default is `corfu-complete'.
  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator)
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous)
        ("M-q" . corfu-quick-complete)
        ("C-q" . corfu-quick-jump))


  :config
  (defun corfu-move-to-minibuffer ()
    (interactive)
    (pcase completion-in-region--data
      (`(,beg ,end ,table ,pred ,extras)
       (let ((completion-extra-properties extras)
             completion-cycle-threshold completion-cycling)
         (consult-completion-in-region beg end table pred)))))
  (keymap-set corfu-map "M-m" #'corfu-move-to-minibuffer)
  (add-to-list 'corfu-continue-commands #'corfu-move-to-minibuffer)

  :init
  (global-corfu-mode))

;; skip it for emacs 31
;; (use-package corfu-terminal
;;   :ensure t
;;   :config
;;   (corfu-terminal-mode +1))

(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

(use-package kind-icon
  :ensure t
  :after corfu
  :custom
  (kind-icon-use-icons nil)
  (kind-icon-blend-background nil)
  (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(provide 'init-corfu)
;;; init-corfu.el ends here
