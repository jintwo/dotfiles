;;; clojure-config.el --- clojure config  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package cider
  :defer t
  :custom
  (nrepl-log-messages t)
  (cider-repl-use-clojure-font-lock t)
  (cider-eval-result-prefix ";; => ")
  (cider-lein-command "/opt/homebrew/bin/lein"))

(provide 'clojure-config)
;;; clojure-config.el ends here
