;;; init-org --- org-mode config
;;; Commentary:
;;; Code:
(require 'org)

(setq org-agenda-files (file-expand-wildcards "~/Dropbox/*.org")
      org-return-follows-link t)

(provide 'init-org)
;;; init-org ends here
