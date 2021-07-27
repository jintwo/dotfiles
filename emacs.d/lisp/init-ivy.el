;;; init-ivy.el --- ivy config
;;; Commentary:
;;; Code:
(use-package ivy
  :config
  (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package swiper)

(use-package counsel
  :config
  (counsel-mode 1))

(provide 'init-ivy)
;;; init-evy.el ends here
