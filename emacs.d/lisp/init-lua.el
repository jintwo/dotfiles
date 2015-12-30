;;; init-lua.el --- lua mode config
;;; Commentary:
;;; Code:
(jin/require-package 'lua-mode)

(require 'lua-mode)
(setq lua-indent-level 4)

(defun lua-goto-definition ()
  "Go to lua defintion."
  (interactive)
  (imenu (lua-funcname-at-point)))

(add-hook 'lua-mode-hook
          (lambda ()
            (setq whitespace-line-column 80)
            (local-set-key (kbd "C-c .") 'lua-goto-definition)
            (local-set-key (kbd "C-c C-j") 'imenu)
            (local-set-key (kbd "C-c C-r") 'lua-send-region)
            (local-set-key (kbd "C-c M-j") 'lua-start-process)))

(provide 'init-lua)
;;; init-lua.el ends here
