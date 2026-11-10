;;; less-themer.el --- simple (less-)theme builder -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defface mode-line-project-name '((t :foreground "green"))
  "default mode-line project name"
  :group 'less-theme)

(defface mode-line-mode-name '((t :weight normal))
  "default mode-line mode name"
  :group 'less-theme)

(defvar less-definition
  '((custom-theme-set-faces
     theme-name
     ;; basic-faces
     `(default ((t (:background ,bg :foreground ,fg))))
     `(cursor ((t (:background ,fg+ :foreground ,bg+))))
     `(link ((t (:underline ,docs))))
     `(secondary-selection ((t ())))
     `(italic ((t (:slant italic))))
     `(underline ((t (:underline ,fg))))
     `(shadow ((t ())))
     `(region ((t (:background ,fade :distant-foreground unspecified))))
     `(escape-glyph ((t ())))
     `(error ((t (:foreground ,red :weight bold))))
     `(warning ((t (:foreground ,warning :weight bold))))
     `(success ((t (:foreground ,green :weight bold))))
     `(minibuffer-prompt ((t ())))
     `(fringe ((t (()))))
     `(variable-pitch ((t ())))
     `(highlight ((t (:background ,fade))))
     `(tab-line ((t (:background ,current-line :foreground ,fg))))
     `(header-line ((t (:background ,current-line :foreground ,fg))))
     `(tab-bar ((t (:background ,current-line :foreground ,fg+ :box (:line-width 3 :color ,current-line :style nil)))))

     ;; font-lock-faces
     `(font-lock-warning-face ((t ())))
     `(font-lock-negation-char-face ((t ())))
     `(font-lock-regexp-grouping-backslash ((t ())))
     `(font-lock-regexp-grouping-construct ((t ())))
     `(font-lock-builtin-face ((t ())))
     `(font-lock-constant-face ((t ())))
     `(font-lock-keyword-face ((t ())))
     `(font-lock-function-name-face ((t ())))
     `(font-lock-variable-name-face ((t ())))
     `(font-lock-preprocessor-face ((t ())))
     `(font-lock-type-face ((t ())))
     `(font-lock-comment-delimiter-face ((t (:foreground ,docs))))
     `(font-lock-comment-face ((t (:foreground ,docs))))
     `(font-lock-doc-face ((t (:foreground ,docs))))
     `(font-lock-string-face ((t (:weight bold :background ,bg+))))

     ;; mode-line-faces
     `(mode-line ((t (:background ,current-line :underline (:color ,fade :position 0) :overline ,fade :box (:color ,current-line :line-width (3 . 3))))))
     `(mode-line-inactive ((t (:underline (:color ,fade :position 0) :overline ,fade :box (:color ,bg :line-width (3 . 3))))))
     `(mode-line-project-name ((t (:foreground ,green))))
     `(mode-line-mode-name ((t (:weight normal))))

     ;; display-line-numbers
     `(line-number ((t (:foreground ,fade))))
     `(line-number-current-line ((t (:foreground ,fg))))

     ;; paren-showing-faces
     `(show-paren-match ((t (:foreground ,fg+ :background ,bg+ :weight ultraheavy))))
     `(show-paren-mismatch ((t (:inherit show-paren-match :inverse-video t))))

     ;; other defaults
     `(fill-column-indicator ((t (:foreground ,fade))))

     ;; tab-bar-faces
     `(tab-bar-tab-inactive ((t (:background ,current-line :foreground ,fg+ :box (:line-width 3 :color ,current-line :style nil)))))
     `(tab-bar-tab ((t (:background ,bg :foreground ,fg :box (:line-width 3 :color ,bg :style nil)))))
     `(tab-bar-tab-ungrouped ((t (:background ,current-line :foreground ,fg+ :box (:line-width 3 :color ,current-line :style nil)))))
     `(tab-bar-tab-group-inactive ((t (:background ,current-line :foreground ,fg+ :box (:line-width 3 :color ,current-line :style nil)))))
     `(tab-bar-tab-group-current ((t (:background ,current-line :foreground ,fg :box (:line-width 3 :color ,current-line :style nil)))))

     `(isearch ((t (:weight bold :background ,green :foreground ,bg))))
     `(lazy-highlight ((t (:weight bold :background ,current-line :foreground ,green))))
     `(match ((t (:foreground ,docs :background ,current-line))))

     `(hl-line ((t (:background ,current-line))))

     `(dired-directory ((t (:weight bold))))

     `(compilation-info ((t (:weight bold))))
     `(compilation-warning ((t (:weight bold :underline t))))
     `(compilation-line-number ((t ())))
     `(compilation-column-number ((t (:underline t))))
     `(compilation-mode-line-exit ((t (:foreground ,green))))
     `(compilation-mode-line-fail ((t (:foreground ,red))))

     `(diff-header ((t (:weight bold))))
     `(diff-context ((t ())))
     `(diff-file-header ((t (:foreground ,docs))))
     `(diff-added ((t (:foreground ,green))))
     `(diff-removed ((t (:foreground ,red))))
     `(diff-changed ((t (:foreground ,yellow))))
     `(diff-refine-added ((t (:foreground ,bg :background ,green))))
     `(diff-refine-removed ((t (:foreground ,bg :background ,red))))

     `(tooltip ((t (:foreground ,bg :background ,fg+))))

     ;; sh-script.el
     `(sh-heredoc ((t (:foreground ,docs :weight bold))))
     `(sh-quoted-exec ((t ())))

     ;; which-func.el
     `(which-func ((t ())))

     ;; package eglot, already builtin
     `(eglot-highlight-symbol-face ((t (:weight ultraheavy))))

     ;; package flymake, already builtin
     `(flymake-note ((t (:underline ,green))))
     `(flymake-error ((t (:underline ,red))))
     `(flymake-warning ((t (:underline ,warning))))
     `(flymake-note-fringe ((t (:foreground ,green))))
     `(flymake-error-fringe ((t (:foreground ,red))))
     `(flymake-warning-fringe ((t (:foreground ,warning))))

     ;; package diff-hl
     `(diff-hl-change ((t (:foreground ,fade :background ,yellow))))
     `(diff-hl-insert ((t (:foreground ,fade :background ,green))))
     `(diff-hl-delete ((t (:foreground ,fade :background ,red))))

     ;; package magit
     `(git-commit-comment-action ((t (:foreground ,docs))))
     `(git-commit-comment-branch-local ((t (:foreground ,docs :weight bold))))
     `(git-commit-comment-branch-remote ((t (:foreground ,docs :weight bold))))
     `(git-commit-comment-file ((t (:foreground ,docs))))
     `(git-commit-comment-heading ((t (:foreground ,docs))))
     `(git-commit-nonempty-second-line ((t (:foreground ,red))))
     `(git-commit-overlong-summary ((t (:foreground ,red))))
     `(git-commit-summary ((t ())))
     `(magit-branch-local ((t (:foreground ,docs))))
     `(magit-branch-remote ((t (:foreground ,warning))))
     `(magit-diff-added ((t (:foreground ,green))))
     `(magit-diff-added-highlight ((t (:foreground ,green))))
     `(magit-diff-context ((t ())))
     `(magit-diff-context-highlight ((t ())))
     `(magit-diff-file-heading ((t (:weight bold))))
     `(magit-diff-hunk-heading ((t (:foreground ,fade :slant italic))))
     `(magit-diff-hunk-heading-highlight ((t (:slant italic))))
     `(magit-diff-lines-heading ((t (:background ,docs :foreground ,bg))))
     `(magit-diff-removed ((t (:foreground ,red))))
     `(magit-diff-removed-highlight ((t (:foreground ,red))))
     `(magit-hash ((t (:inherit magit-dimmed))))
     `(magit-header ((t (:weight bold))))
     `(magit-log-author ((t (:foreground ,fg))))
     `(magit-log-date ((t (:foreground ,fade))))
     `(magit-section-heading ((t (:weight bold))))
     `(magit-section-heading-selection ((t ())))
     `(magit-section-highlight ((t (:background ,current-line))))
     `(magit-selection ((t ())))
     `(magit-selection-highlight ((t ())))
     `(magit-selection-title ((t ())))

     ;; package forge
     `(forge-pullreq-open ((t (:foreground ,green))))

     ;; package org-mode
     `(org-agenda-current-time ((t (:foreground ,red))))
     `(org-document-title ((t (:weight bold))))
     `(org-footnote ((t ())))
     `(org-level-1 ((t (:foreground ,docs :weight bold))))
     `(org-level-2 ((t (:foreground ,docs :weight bold))))
     `(org-level-3 ((t (:foreground ,docs :weight bold))))
     `(org-level-4 ((t (:foreground ,docs :weight bold))))
     `(org-level-5 ((t (:foreground ,docs :weight bold))))
     `(org-level-6 ((t (:foreground ,docs :weight bold))))
     `(org-level-7 ((t (:foreground ,docs :weight bold))))
     `(org-level-8 ((t (:foreground ,docs :weight bold))))
     `(org-date ((t ())))
     `(org-tag ((t (:foreground ,docs))))
     `(org-todo ((t (:foreground ,warning))))
     `(org-done ((t (:foreground ,green))))
     `(org-block ((t ())))
     `(org-table ((t ())))
     `(org-block-begin-line ((t (:background ,bg+ :foreground ,fg+ :extend t))))
     `(org-block-end-line ((t (:background ,bg+ :foreground ,fg+ :extend t))))
     `(org-meta-line ((t (:foreground ,fg+))))
     `(org-document-info-keyword ((t ())))
     `(org-document-info ((t ())))
     `(org-drawer ((t (:foreground ,docs))))
     `(org-scheduled ((t (:foreground ,green :weight bold))))
     `(org-scheduled-today ((t (:foreground ,green :weight bold))))

     ;; package markdown-mode
     `(markdown-bold-face ((t (:weight bold))))
     `(markdown-italic-face ((t (:italic t))))
     `(markdown-link-face ((t ())))
     `(markdown-markup-face ((t ())))
     `(markdown-url-face ((t (:underline t))))
     `(markdown-header-delimiter-face ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-1 ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-2 ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-3 ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-4 ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-5 ((t (:foreground ,docs :weight bold))))
     `(markdown-header-face-6 ((t (:foreground ,docs :weight bold))))

     ;; package corfu
     `(corfu-border ((t (:background ,fade))))
     `(corfu-default ((t (:background ,current-line))))

     ;; package eat
     `(eat-term-color-1 ((t (:foreground ,red)))) ;; red
     `(eat-term-color-2 ((t (:foreground ,green))))  ;; green
     `(eat-term-color-3 ((t (:foreground ,yellow)))) ;; yellow
     `(eat-term-color-4 ((t (:foreground ,blue)))) ;; blue
     `(eat-term-color-6 ((t (:foreground ,docs)))) ;; cyan
     `(eat-term-color-7 ((t (:foreground ,fade)))) ;; ~white
     `(eat-term-faint ((t (:weight normal))))

     ;; package ghostel
     `(ghostel-color-red ((t (:foreground ,red))))
     `(ghostel-color-green ((t (:foreground ,green))))
     `(ghostel-color-yellow ((t (:foreground ,yellow))))
     `(ghostel-color-blue ((t (:foreground ,blue))))
     `(ghostel-color-cyan ((t (:foreground ,docs))))
     `(ghostel-color-white ((t (:foreground ,fade))))

     ;; package jupyter
     `(jupyter-repl-input-prompt ((t (:foreground ,green))))
     `(jupyter-repl-output-prompt ((t (:foreground ,red)))))))

(defmacro make-less-theme (theme-name colors-alist)
  (let ((colors-alist* (eval colors-alist)))
    `(let (,@(mapcar (lambda (cons)
                       (list (car cons) (cdr cons)))
                     colors-alist*)
           (theme-name ,theme-name))
       ,@less-definition)))

(provide 'less-themer)
;;; less-themer.el ends here
