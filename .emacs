(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; Load monokai soda theme

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'monokai-dark-soda t)

;; Powerline mode bar

(require 'powerline)
(powerline-default-theme)

;; Reverse colors for the border to have nicer line

(set-face-inverse-video-p 'vertical-border nil)
(set-face-background 'vertical-border (face-background 'default))

;; Set symbol for the border

(set-display-table-slot standard-display-table
			'vertical-border
			(make-glyph-code ?\u2502))

;; Set stuff for GUI emacs

(when window-system
    (set-fringe-mode 0)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (menu-bar-mode -1))

;; Tab mode

(setq c-default-style "bsd"
      c-basic-offset 4)

;; Line numbering

(setq mode-line-format nil)

(global-linum-mode t)
(setq linum-format "%4d\u2502")

;; Disable annoying backup files

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Random emacs generated junk

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3b1973119d3ca55a31abffd64cf6b7d12ce9de125ae07574dd43b90c5f9d5896" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
