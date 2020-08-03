;;; init-packages.el --- packages repos config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(package-initialize)

(setq package-check-signature nil)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-minimum-reported-time 0
      use-package-verbose t)

(provide 'init-packages)
;;; init-packages.el ends here
