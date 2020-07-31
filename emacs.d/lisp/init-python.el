;;; init-python.el --- Python dev config
;;; Commentary:
;;; Code:
(use-package ein
  :ensure t
  :defer t)

(add-hook 'python-mode-hook
          (lambda ()
            (progn
              (local-unset-key (kbd "C-c C-c"))
              (local-unset-key (kbd "C-c C-p")))))

(provide 'init-python)
;;; init-python.el ends here
