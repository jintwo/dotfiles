;;; init-python.el --- python mode config
;;; Commentary:
;;; Code:
(jin/require-package 'python-mode 'elpy 'jinja2-mode
                     'python-environment 'pyenv-mode)

(jin/add-auto-mode 'python-mode "fabfile")
(jin/add-auto-mode 'clojure-mode "\\.hy\\'")
(jin/add-auto-mode 'jinja2-mode "\\.tmpl\\'" "\\.html\\'")

(elpy-enable)
(elpy-use-ipython)
(pyenv-mode)

(define-key python-mode-map (kbd "C-c .") 'elpy-goto-definition)
(define-key python-mode-map (kbd "C-c ,") 'pop-tag-mark)
(define-key python-mode-map (kbd "C-c M-j") 'run-python)

(defun annotate-pdb ()
  "Highlight line that contain pdb/ipdb call."
  (interactive)
  (highlight-lines-matching-regexp "import i?pdb")
  (highlight-lines-matching-regexp "i?pdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

(provide 'init-python)
;;; init-python.el ends here
