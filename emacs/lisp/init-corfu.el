;;; init-corfu.el --- Corfu completion config
;;; Commentary:
;;; Code:

(use-package corfu
  :ensure t
  ;; TAB-and-Go customizations
  :custom
  (corfu-cycle t)             ;; Enable cycling for `corfu-next/previous'
  (corfu-preselect-first nil) ;; Disable candidate preselection

  ;; Use TAB for cycling, default is `corfu-complete'.
  :bind
  (:map corfu-map
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))

  :init
  (global-corfu-mode))

(use-package corfu-terminal
  :ensure t
  :config
  (corfu-terminal-mode +1))

(provide 'init-corfu)
;;; init-corfu.el ends here
