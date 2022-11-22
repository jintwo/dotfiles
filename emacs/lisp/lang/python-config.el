;;; python-config.el --- python config
;;; Commentary:
;;; Code:
(use-package pyvenv
  :defer t
  :config
  (pyvenv-mode 1))

(use-package ein
  :defer t)

(use-package python-mls
  :config
  (python-mls-setup))

(when (featurep 'init-eglot)
  (add-hook 'python-mode-hook #'eglot-ensure))

(use-package hy-mode
  :mode ("\\.hy\\'"))


;; python-mode templates
(when (featurep 'tempo)

  (tempo-define-template "py-write-json"
                         '("with open(\"" (p "File: " file) "\", \"a+\") as outf:" > n
                           > "json.dump(" (p "Variable: " var) ", outf)"))

  (tempo-define-template "py-log-json"
                         '("logger.debug(json.dumps(" (p "Variable: " var) "))" > n)))

(provide 'python-config)
;;; python-config.el ends here
