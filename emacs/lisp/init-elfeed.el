;;; init-elfeed.el --- elfeed config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package elfeed
  :defer 1
  :bind (:map global-map (("s-f" . elfeed)))
  :custom
  ;; (elfeed-show-entry-switch #'j2/elfeed-display-buffer)
  ;; (elfeed-show-entry-delete #'j2/elfeed-delete-buffer)
  (elfeed-search-remain-on-entry t))

;; deps ;)
;; (use-package popwin
;;   :ensure t)

;; (defun j2/elfeed-display-buffer (buf &optional act)
;;   (popwin:popup-buffer buf
;;                        :position 'bottom
;;                        :width 0.7
;;                        :height 0.7
;;                        :stick t
;;                        :dedicated t
;;                        :noselect nil))

;; (defun j2/elfeed-delete-buffer ()
;;   (let* ((buf (get-buffer "elfeed-entry*"))
;;          (window (get-buffer-window buf)))
;;     (kill-buffer buf)
;;     (delete-window window)))

(use-package elfeed-tube
  :ensure t
  :after elfeed
  :config
  (elfeed-tube-setup))

(use-package elfeed-tube-mpv
  :ensure t
  :after elfeed-tube)

(use-package elfeed-org
  :ensure t
  :after elfeed
  :custom
  (rmh-elfeed-org-files (list (f-join org-directory "feeds.org")))
  :config
  (require 'elfeed-org)
  (elfeed-org))

(defun elfeed-tube-add-feed-at-point ()
  (interactive)
  (let ((url (thing-at-point 'url)))
    (elfeed-tube-add-feeds url)))

;; db-hack
(define-advice elfeed-search--header (:around (oldfun &rest args))
  (if elfeed-db
      (apply oldfun args)
    "No database loaded yet"))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
