;;; python-config.el --- python config
;;; Commentary:
;;; Code:
(use-package python
  :hook ((python-mode python-ts-mode) . j2/project-eglot-ensure))

(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package python-mls
  :hook (inferior-python-mode . python-mls-mode))

(use-package jupyter
  :defer t)

(use-package hy-mode
  :mode ("\\.hy\\'"))

(use-package python-black
  :defer t)

(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . prog-mode))

;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "--simple-prompt"
;;       python-shell-prompt-detect-failure-warning nil
;;       python-shell-completion-native-disabled-interpreters '("ipython" "python3" "python")
;;       python-indent-offset 4)

;; python-mode templates
(when (featurep 'tempo)

  (tempo-define-template "py-write-json"
                         '("with open(\"" (p "File: " file) "\", \"a+\") as outf:" > n
                           > "json.dump(" (p "Variable: " var) ", outf)"))

  (tempo-define-template "py-log-json"
                         '("logger.debug(json.dumps(" (p "Variable: " var) "))" > n))

  (tempo-define-template "py-log-pformat"
                         '(> "from pprint import pformat" n
                           > "logger.debug('" (p "Prefix: " pfx) " %s', "
                           "pformat(" (p "Variable: " var) "))" n)))

(provide 'python-config)
;;; python-config.el ends here
