;;; clojure.el --- clojure config
;;; Commentary:
;;; Code:
(use-package cider
  :defer t
  :config
  (setq nrepl-log-messages t
        cider-repl-use-clojure-font-lock t
        cider-eval-result-prefix ";; => ")
  :custom
  (cider-lein-command "/usr/local/bin/lein"))

(provide 'lang/clojure)
;;; clojure.el ends here
