;;; init-projectile --- projectile minor mode config
;;; Commentary:
;;; Code:
(defun projectile-mode-line ()
  "Get projectile mode-line for current project."
  (cond ((file-remote-p default-directory) " projectile")
        ((boundp 'pyvenv-virtual-env-name) (format " proj[%s/py:%s]" (projectile-project-name) pyvenv-virtual-env-name))
        (t (format " proj[%s]" (projectile-project-name)))))

(use-package grizzl
  :ensure t)

(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'grizzl)
  :functions projectile-project-name
  :custom
  (projectile-keymap-prefix (kbd "C-c p"))
  (projectile-mode-line (quote (:eval (projectile-mode-line))))
  (projectile-mode))

(use-package helm-projectile
  :requires projectile
  :ensure t
  :bind
  ("C-c p p" . helm-projectile-switch-project)
  :config
  (helm-projectile-on))

(provide 'init-projectile)
;;; init-projectile.el ends here
