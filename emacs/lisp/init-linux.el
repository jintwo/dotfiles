;;; init-linux.el --- linux related stuff
;;; Commentary:
;;; Code:

(setq browse-url-epiphany-new-window-is-tab t)

(setq browse-url-handlers
      '(("^\\(http\\|https\\)://" . browse-url-epiphany)))

(provide 'init-linux)
;;; init-linux.el ends here