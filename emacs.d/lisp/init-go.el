;;; init-go.el --- go mode config
;;; Commentary:
;;; Code:
(jin/require-package 'go-mode 'company-go 'flycheck-gometalinter)

(defconst *go-path* (expand-file-name "~/Documents/Sandbox/go"))
(add-to-list 'exec-path (format "%s/bin" *go-path*))
(setenv "GOPATH" *go-path*)

(require 'company)
(push 'company-go company-backends)

(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq standard-indent 4)
            (setq indent-tabs-mode t)
            (local-set-key (kbd "C-c .") 'godef-jump)))

(add-hook 'before-save-hook 'gofmt-before-save)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-gometalinter-setup))

(provide 'init-go)
;;; init-go.el ends here
