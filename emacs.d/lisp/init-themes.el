;;; init-themes.el --- color themes config
;;; Commentary:
;;; Code:
(jin/require-package 'subatomic-theme 'zenburn-theme 'noctilux-theme
                     'flatland-theme 'monokai-theme 'solarized-theme
                     'flatui-theme 'ample-theme 'dracula-theme
                     'material-theme 'ujelly-theme)

;; (load-theme 'material t) ;; ++ dark
(load-theme 'ujelly t) ;; ++ dark
;; (load-theme 'subatomic t) ;; ++ dark
;; (load-theme 'zenburn t)
;; (load-theme 'noctilux t) ;; + dark
;; (load-theme 'flatland t) ;; + dark
;; (load-theme 'monokai t) ;; ++ dark
;; (load-theme 'solarized-dark t)
;; (load-theme 'solarized-light t)
;; (load-theme 'flatui t) ;; light
;; (load-theme 'ample t)
;; (load-theme 'ample-flat t)
;; (load-theme 'ample-light t)
;; (load-theme 'dracula t) ;; + dark

(provide 'init-themes)
;;; init-themes.el ends here
