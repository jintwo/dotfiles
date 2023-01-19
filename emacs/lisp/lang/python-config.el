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

(when (featurep 'tree-sitter-hl)
  (add-hook 'python-mode-hook #'tree-sitter-hl-mode))

(when (featurep 'init-eglot)
  (add-hook 'python-mode-hook
            (lambda ()
              (when (project-current) (eglot-ensure)))))

(use-package hy-mode
  :mode ("\\.hy\\'"))

(use-package python-black
  :defer t)

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
