;;; init.el --- simple config
;;; Commentary:
;;; Code:

(load-library "url-handlers")

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(defconst user-lib-path (expand-file-name "lisp" user-emacs-directory))
(defconst vendor-lib-path (expand-file-name "vendor" user-emacs-directory))

;; (add-to-list 'load-path vendor-lib-path)

(add-to-list 'load-path user-lib-path)

;; load vendor modules
(require 'dash)

(defun is-valid-dir-p (path)
  "Check is PATH valid directory name."
  (not (or (string= path ".") (string= path ".."))))

(let* ((contents (directory-files vendor-lib-path))
       (vendor-modules (-filter 'is-valid-dir-p contents)))
  (-each vendor-modules (lambda (mod-name) (add-to-list 'load-path (format "%s/%s" vendor-lib-path mod-name)))))

(setenv "ESHELL" (expand-file-name "~/bin/eshell"))

(setq
 exec-path (append '("/bin" "/sbin" "/usr/sbin" "/usr/bin" "/usr/local/bin" "/usr/local/sbin" "~/bin/" "~/Documents/Work/Lance/drip-adserver/bin"))
 backup-directory-alist `(("." . "~/.emacs.d/saves"))
 initial-frame-alist '((top . 0) (left . 0) (width . 140) (height . 40)))

(setq-default
 truncate-lines 1
 ffap-machine-p-known 'reject)

(set-frame-parameter (selected-frame) 'alpha '(93 93))
(add-to-list 'default-frame-alist '(alpha 93 93))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-lein-command "/usr/local/bin/lein")
 '(custom-safe-themes
   (quote
    ("133222702a3c75d16ea9c50743f66b987a7209fb8b964f2c0938a816a83379a0" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elpy-rpc-python-command "python3")
 '(magit-use-overlays nil)
 '(markdown-css-paths
   (quote
    ("http://jasonm23.github.io/markdown-css-themes/markdown.css")))
 '(neo-theme (quote ascii))
 '(package-selected-packages
   (quote
    (company-tern dash-at-point zenburn-theme yaml-mode web-mode unicode-whitespace toml-mode tangotango-theme tabulated-list swift-mode sublime-themes subatomic256-theme subatomic-theme soothe-theme solarized-theme sml-mode smartparens slime-company rust-mode rich-minority resize-window rainbow-delimiters racket-mode python-mode python-environment pyenv-mode protobuf-mode pcre2el pastelmac-theme paradox obsidian-theme noctilux-theme nim-mode neotree naquadah-theme multiple-cursors monokai-theme markdown-mode lua-mode llvm-mode julia-mode json-reformat jinja2-mode idomenu ibuffer-vc ht heroku-theme helm-projectile helm-ag gruber-darker-theme groovy-mode grizzl graphviz-dot-mode gradle-mode go-projectile gitconfig-mode gist fsm fold-this flycheck-gometalinter flatui-theme flatland-theme exec-path-from-shell evil-surround evil-nerd-commenter evil-magit evil-leader ensime enh-ruby-mode emamux elpy edts dtrace-script-mode dracula-theme dockerfile-mode direx company-irony company-go company-ghc color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmake-mode cider ample-theme alchemist ag afternoon-theme)))
 '(paradox-github-token t)
 '(projectile-hg-command "/usr/local/bin/hg locate -0 -I .")
 '(safe-local-variable-values
   (quote
    ((eval when
           (fboundp
            (quote rainbow-mode))
           (rainbow-mode 1))
     (encoding . utf-8)
     (haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(solarized-use-less-bold t)
 '(swift-indent-offset 2))

;; base
(require 'init-base)
(require 'init-themes)
(require 'init-gui)

;; utils
(require 'init-projectile)
(require 'init-helm)
(require 'init-utils)
(require 'init-ibuffer)
(require 'init-evil)
(require 'init-org)

;; dev
(require 'init-company)
(require 'init-vc)
(require 'init-flycheck)
(require 'init-sp)
(require 'init-markup)
(require 'init-python)
(require 'init-lisp)
(require 'init-go)
(require 'init-haskell)
(require 'init-scala)
(require 'init-lua)
(require 'init-lang)

;; private
(when (file-exists-p (format "%s/init-private.el" user-lib-path))
  (require 'init-private))

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
