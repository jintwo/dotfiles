;;; init-ui.el --- ui config
;;; Commentary:
;;; Code:

;; stolen from https://stackoverflow.com/questions/24956521/how-can-i-hide-the-menu-bar-from-a-specific-frame-in-emacs
(defun contextual-menubar (&optional frame)
  "Display the menubar in FRAME (default: selected frame) if on a
    graphical display, but hide it if in terminal."
  (interactive)
  (set-frame-parameter frame 'menu-bar-lines 0))
(add-hook 'after-make-frame-functions 'contextual-menubar)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode 0)

;; --- tabs ---
(defun j2/tab-bar-tab-name-format (tab i)
  (let ((current-p (eq (car tab) 'current-tab)))
    (propertize
     (concat " "
             (if tab-bar-tab-hints (format "%d " i) "")
             (alist-get 'name tab)
             (or (and tab-bar-close-button-show
                      (not (eq tab-bar-close-button-show
                               (if current-p 'non-selected 'selected)))
                      tab-bar-close-button)
                 "")
             " ")
     'face (funcall tab-bar-tab-face-function tab))))

;; stolen from https://www.gonsie.com/blorg/tab-bar.html and vim-tab-bar (https://github.com/jamescherti/vim-tab-bar.el)
(setq tab-bar-show t
      tab-bar-close-button-show nil
      tab-bar-new-tab-choice "*scratch*"
      tab-bar-tab-hints nil
      tab-bar-format '(tab-bar-format-tabs tab-bar-separator)
      tab-bar-auto-width nil
      tab-bar-separator "\u200B"
      tab-bar-tab-name-format-function #'j2/tab-bar-tab-name-format)

(tab-bar-mode t)
;; --- tabs section ends here ---

(setq visible-cursor nil)
(setq mouse-autoselect-window t)

;; smooth scroll >= 29
(pixel-scroll-precision-mode 1)
(setq pixel-scroll-precision-large-scroll-height 35.0)

(let ((no-border '(internal-border-width . 5)))
  (add-to-list 'initial-frame-alist no-border)
  (add-to-list 'default-frame-alist no-border)
  (add-to-list 'default-frame-alist '(undecorated-round . t))
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(set-language-environment "UTF-8")

(defun j2/next-font-weight (weight)
  "Get next font WEIGHT."
  (let* ((weights (mapcar #'(lambda (x) (aref x 1)) font-weight-table))
         (max-idx (- (length weights) 1))
         (weight-idx (seq-position weights weight)))
    (if (and (numberp weight-idx)
             (< weight-idx max-idx))
        (seq-elt weights (1+ weight-idx))
      'normal)))

(defun j2/set-font (family height &optional weight bold-weight)
  "Set font FAMILY with given HEIGHT and optional WEIGHT and BOLD-WEIGHT."
  (interactive)
  (unless weight (setq weight 'normal))
  (unless bold-weight (setq bold-weight (j2/next-font-weight weight)))
  ;; default
  (set-face-attribute 'default nil :family family :height height :weight weight :width 'normal)
  ;; fixed-pitch
  (set-face-attribute 'fixed-pitch nil :family family :height height :weight weight :width 'normal)
  ;; fixed-pitch-serif (w/o serifs)
  (set-face-attribute 'fixed-pitch-serif nil :family family :height height :weight weight :width 'normal)
  ;; strings + docs should be bold
  (set-face-attribute 'font-lock-string-face nil :weight bold-weight)
  (set-face-attribute 'font-lock-doc-face nil :weight bold-weight)
  (set-fontset-font "fontset-default" 'unicode-bmp family))

(defun j2/init-ui-mac-daemon ()
  (j2/set-font "Iosevka" 120 'medium 'bold)
  (toggle-frame-fullscreen))

(defun j2/init-ui-linux ()
  (j2/set-font "Iosevka" 90 'medium 'bold))

(defun j2/init-ui ()
  "UI settings."
  (interactive)
  (cond
   ((null initial-window-system) (j2/init-ui-mac-daemon))
   (t (j2/init-ui-linux))))

(global-hl-line-mode t)

;; mode-line
(line-number-mode t)
(column-number-mode t)
(setq size-indication-mode nil)

;; theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))

(defun j2/load-theme (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  (pcase appearance
    ('light (load-theme 'kaoless-new t))
    ('dark (load-theme 'nordless-new t))))

(defun j2/init-appearance-mac-daemon ()
  (add-hook 'ns-system-appearance-change-functions #'j2/load-theme))

(defun j2/init-appearance-linux ()
  (use-package auto-dark
    :ensure t
    :config
    (setq auto-dark-dark-theme 'nordless-new
          auto-dark-light-theme 'kaoless-new
          auto-dark-polling-interval-seconds 5)
    (auto-dark-mode t)))

(defun j2/init-appearance ()
  (cond
   ((null initial-window-system) (j2/init-appearance-mac-daemon))
   (t (j2/init-appearance-linux))))

;; windows
(use-package ace-window
  :ensure t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-dispatch-always t
        aw-dispatch-alist
        '((?0 aw-delete-window "Delete Window")
          (?m aw-swap-window "Swap Windows")
          (?M aw-move-window "Move Window")
          (?c aw-copy-window "Copy Window")
          (?J aw-switch-buffer-in-window "Select Buffer")
          (?n aw-flip-window)
          (?u aw-switch-buffer-other-window "Switch Buffer Other Window")
          (?e aw-execute-command-other-window "Execute Command Other Window")
          (?F aw-split-window-fair "Split Fair Window")
          (?2 aw-split-window-vert "Split Vert Window")
          (?3 aw-split-window-horz "Split Horz Window")
          (?o delete-other-windows "Delete Other Windows")
          (?T aw-transpose-frame "Transpose Frame")
          ;; ?i ?r ?t are used by hyperbole.el
          (?? aw-show-dispatch-help))
        aw-minibuffer-flag t
        aw-ignore-current nil)
  :bind (("M-o" . ace-window)))

(winner-mode t)

(use-package helpful
  :defer t
  :bind (:map global-map (("C-h f" . helpful-callable)
                          ("C-h v" . helpful-variable)
                          ("C-h k" . helpful-key)
                          ("C-h d" . helpful-at-point)
                          ("C-h F" . helpful-function)
                          ("C-h C" . helpful-command))))

;; term
(use-package eterm-256color
  :ensure t
  :hook (term-mode . eterm-256color-mode))

(when (and (boundp 'server-process)
	   (memq (process-status server-process) '(connect listen open run)))
  (when (featurep 'ns)
    (defun ns-raise-emacs ()
      "Raise Emacs."
      (ns-do-applescript "tell application \"Emacs\" to activate"))
    (defun ns-raise-emacs-with-frame (frame)
      "Raise Emacs and select the provided frame."
      (with-selected-frame frame
	(when (display-graphic-p)
          (ns-raise-emacs))))
    (add-hook 'after-make-frame-functions 'ns-raise-emacs-with-frame)
    (when (display-graphic-p)
      (ns-raise-emacs))))

(setq switch-to-buffer-obey-display-actions t)

(add-hook 'after-init-hook (lambda ()
                             (j2/init-ui)
                             (j2/init-appearance)))


;; disable accidential zoom-in/out (https://lmno.lol/alvaro/hey-mouse-dont-mess-with-my-emacs-font-size)
(global-set-key (kbd "<pinch>") 'ignore)
(global-set-key (kbd "<C-wheel-up>") 'ignore)
(global-set-key (kbd "<C-wheel-down>") 'ignore)

;; disable suspend-frame
(global-set-key (kbd "C-z") 'ignore)

(use-package delight
  :ensure t)

(provide 'init-ui)
;;; init-ui.el ends here
