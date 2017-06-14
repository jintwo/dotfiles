;;; init-python.el --- python mode config
;;; Commentary:
;;; Code:
(jin/require-package 'python-mode 'elpy 'jinja2-mode)

(jin/add-auto-mode 'python-mode "fabfile")
(jin/add-auto-mode 'jinja2-mode "\\.tmpl\\'")

(elpy-enable)

(require 'python)
(define-key python-mode-map (kbd "C-c .") 'elpy-goto-definition)
(define-key python-mode-map (kbd "C-c ,") 'pop-tag-mark)
(define-key python-mode-map (kbd "C-c M-j") 'run-python)
(define-key python-mode-map (kbd "C-c C-j") 'popup-imenu)

(defun annotate-pdb ()
  "Highlight line that contain pdb/ipdb call."
  (interactive)
  (highlight-lines-matching-regexp "import i?pdb")
  (highlight-lines-matching-regexp "i?pdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

;; fix encoding
(setenv "LC_CTYPE" "UTF-8")
(setenv "LC_ALL" "en_US.UTF-8")
(setenv "LANG" "en_US.UTF-8")

(provide 'init-python)
;;; init-python.el ends here
