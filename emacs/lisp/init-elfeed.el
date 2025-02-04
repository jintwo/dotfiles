;;; init-elfeed.el --- elfeed config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package elfeed
  :defer 1
  :bind (:map global-map (("C-c u f" . elfeed)))
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
  :after elfeed
  :config
  (elfeed-tube-setup)
  (bind-key "d" #'j2/elfeed-tube-download-entry 'elfeed-search-mode-map))

(use-package elfeed-tube-mpv
  :ensure t
  :after elfeed-tube)

(use-package elfeed-org
  :ensure t
  :after elfeed
  :config
  (require 'org-roam)
  (setq rmh-elfeed-org-files (list (org-roam-node-file (org-roam-node-from-title-or-alias "feeds"))))
  (require 'elfeed-org)
  (elfeed-org))

(defun elfeed-tube-add-feed-at-point ()
  (interactive)
  (let ((url (thing-at-point 'url)))
    (elfeed-tube-add-feeds url)))

(defun j2/elfeed-tube-download-entry ()
  (interactive)
  (elfeed-search-untag-all-unread)
  (yt-dlp-url (elfeed-entry-link (car (elfeed-search-selected)))))

(defun yt-dlp-url (url)
  (let* ((default-directory "~/Downloads/yt/")
         (proc (start-process
                (format "yt-dlp download: %s" url)
                (get-buffer-create (format "*yt-dlp*: %s" url))
                "yt-dlp" "--no-progress" url)))
    (set-process-sentinel
     proc
     (lambda (process s)
       (unless (process-live-p process)
         (if (eq (process-exit-status process) 0)
             (progn
               (message "Finished download: %s" url)
               (kill-buffer (process-buffer process)))
           (message "Download: [%s] failed (%d) with error: %s"
                    url (process-exit-status process) s)))))
    (message "Started download: %s" url)))

(defun yt-dlp-at-point ()
  (interactive)
  (let ((url (thing-at-point 'url)))
    (yt-dlp-url url)))

;; db-hack
(define-advice elfeed-search--header (:around (oldfun &rest args))
  (if elfeed-db
      (apply oldfun args)
    "No database loaded yet"))

(provide 'init-elfeed)
;;; init-elfeed.el ends here
