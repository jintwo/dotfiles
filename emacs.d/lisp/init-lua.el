;;; init-lua.el --- lua mode config
;;; Commentary:
;;; Code:
(use-package lua-mode
  :ensure t
  :init (setq lua-indent-level 4)
  :bind (("C-c ." . lua-goto-definition)
         ("C-c C-j" . imenu)
         ("C-c C-r" . lua-send-region)
         ("C-c M-j" . lua-start-process))
  :config
  (defun lua-goto-definition ()
    "Go to lua defintion."
    (interactive)
    (imenu (lua-funcname-at-point))))

(provide 'init-lua)
;;; init-lua.el ends here
