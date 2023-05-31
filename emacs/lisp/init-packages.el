;;; init-packages.el --- packages repos config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://jorgenschaefer.github.io/packages/") t)

(require 'use-package)
(setq use-package-always-ensure t
      use-package-verbose t)

(provide 'init-packages)
;;; init-packages.el ends here
