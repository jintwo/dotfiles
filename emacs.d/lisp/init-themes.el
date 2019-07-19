;;; init-themes.el --- color themes config
;;; Commentary:
;;; Code:
;;; TODO: move things bellow to use-package + try circadian

(use-package nordless-theme
  :ensure t
  :config
  (load-theme 'nordless t))

;; (use-package nord-theme
;;   :ensure t
;;   :config
;;   (load-theme 'nord t))

;; (use-package arjen-grey-theme
;;   :ensure t
;;   :config
;;   (load-theme 'arjen-grey t))

;; now they are best :)
;; (load-theme 'ujelly-light t) ;; ++ dark+light :)
;; (load-theme 'arjen-grey t) ;; + dark
;; (load-theme 'nordless t) ;; +

;; check
;; (load-theme 'apropospriate-dark t) ;; ++ dark
;; (load-theme 'apropospriate-light t)
;; (load-theme 'ujelly t) ;; ++ dark

(provide 'init-themes)
;;; init-themes.el ends here
