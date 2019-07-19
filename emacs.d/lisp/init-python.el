;;; init-python.el --- python mode config
;;; Commentary:
;;; Code:
(use-package python-mode
  :ensure t
  :mode ("\\fabfile\\'" "\\.py\\'")
  :config
  (use-package elpy
    :ensure t
    :commands elpy-enable
    :bind (:map python-mode-map
                ("C-c ." . elpy-goto-definition)
                ("C-c ," . pop-tag-mark)
                ("C-c M-j" . run-python))
    :config
    (setq elpy-modules (dolist (elem '(elpy-module-highlight-indentation
                                       elpy-module-yasnippet))
                         (remove elem elpy-modules))))
  (elpy-enable)
  (require 'smartparens-python)
  (add-hook 'python-mode-hook
            (lambda ()
              (interactive)
              (add-to-list (make-local-variable 'company-backends) '(elpy-company-backend))
              (highlight-lines-matching-regexp "import i?pdb")
              (highlight-lines-matching-regexp "i?pdb.set_trace()")
              (electric-indent-local-mode -1))))



;; fix encoding
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(provide 'init-python)
;;; init-python.el ends here
