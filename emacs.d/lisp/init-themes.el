;;; init-themes.el --- color themes config
;;; Commentary:
;;; Code:
;;; TODO: move things bellow to use-package + try circadian

(use-package nordless-theme
  :ensure t
  :config
  (load-theme 'nordless t))

;; (use-package arjen-grey-theme
;;   :ensure t)

;; now they are best :)
;; (load-theme 'ujelly-light t) ;; ++ dark+light :)
;; (load-theme 'arjen-grey t) ;; + dark
;; (load-theme 'nordless t) ;; +

;; check
;; (load-theme 'apropospriate-dark t) ;; ++ dark
;; (load-theme 'apropospriate-light t)
;; (load-theme 'nord t) ;; ++ dark
;; (load-theme 'nova t) ;; +
;; (load-theme 'ujelly t) ;; ++ dark
;; (load-theme 'material t) ;; ++ dark
;; (load-theme 'subatomic t) ;; ++ dark
;; (load-theme 'noctilux t) ;; + dark
;; (load-theme 'flatland t) ;; + dark
;; (load-theme 'monokai t) ;; ++ dark
;; (load-theme 'flatui t) ;; light
;; (load-theme 'dracula t) ;; + dark
;; (load-theme 'doom-tomorrow-night t) ;; + dark
;; (load-theme 'doom-vibrant t) ;; + dark
;; (load-theme 'atom-one-dark t) ;; + dark
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)
;; (load-theme 'ample t)
;; (load-theme 'ample-flat t)
;; (load-theme 'ample-light t)
;; kaolin

(provide 'init-themes)
;;; init-themes.el ends here
