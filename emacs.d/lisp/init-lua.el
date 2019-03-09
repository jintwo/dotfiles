;;; init-lua.el --- lua mode config
;;; Commentary:
;;; Code:
(use-package lua-mode
  :ensure t
  :bind (:map lua-mode-map
              (("C-c ." . lua-goto-definition)
               ("C-c ," . pop-tag-mark)
               ("C-c C-j" . imenu)
               ("C-c C-r" . lua-send-region)
               ("C-c M-j" . lua-start-process)))
  :config
  (setq lua-indent-level 4)
  (defun lua-goto-definition ()
    "Go to lua defintion."
    (interactive)
    (imenu (lua-funcname-at-point))))

(provide 'init-lua)
;;; init-lua.el ends here
