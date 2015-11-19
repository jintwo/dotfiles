;;; init-go.el --- go mode config
;;; Commentary:
;;; Code:
(jin/require-package 'go-mode 'company-go)

(defconst *go-path* (expand-file-name "~/Documents/Sandbox/go"))
(add-to-list 'exec-path (format "%s/bin" *go-path*))
(setenv "GOPATH" *go-path*)

(push 'company-go company-backends)

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq standard-indent 4)
            (setq indent-tabs-mode t)
            (local-set-key (kbd "C-c .") 'godef-jump)))

(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-go)
;;; init-go.el ends here
