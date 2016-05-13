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

(defun terminal-disable-bg( )
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'terminal-disable-bg)

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
    (scroll-bar-mode -1))

(menu-bar-mode -1)

;; Tab mode

(setq c-default-style "bsd"
      c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(setq tab-stop-list (number-sequence 4 60 4))

;; Line numbering

(setq mode-line-format nil)

(global-linum-mode t)
(setq linum-format "%4d\u2502")

;; Disable annoying backup files

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Startup fortune

(defun cowsay-startup( )
  
  (when (eq system-type 'darwin)        ;; When on mac our fortune and cowsay are installed to /usr/bin/local
    (defconst fortune-path "/usr/bin/local/fortune")
    (defconst cowsay-path "/usr/bin/local/cowsay"))
  
  (unless (eq system-type 'darwin)
    (defconst fortune-path "/usr/bin/fortune")
    (defconst cowsay-path "/usr/bin/cowsay"))
  
  (defconst fortune (concat fortune-path " -a computers"))
  (defconst scrwidth ( - (frame-width (selected-frame)) 5 ))
  (defconst cowsay (concat cowsay-path " -W " (number-to-string(symbol-value `scrwidth))))
  
  (with-current-buffer (generate-new-buffer "cowsay-startup")
    (insert "Welcome to GNU/Emacs\n\n")
    (insert "C-x C-c to quit\nC-x C-s to save\nC-x C-f to open file or directory\nC-x b to switch buffer\n\n")
    (call-process-shell-command (concat fortune " | " cowsay) nil t nil )
    (setq buffer-read-only t)
    (setq cursor-type nil)
    (beginning-of-buffer)
    (current-buffer)))

;; Because initial-buffer-choice always changes the initial buffer no
;; matter what, we have to change the buffer ourselves after startup

(defun cowsay-checkbuffer( )
  (if (string= (buffer-name) "*scratch*")
      (switch-to-buffer (funcall 'cowsay-startup)) ))

(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'cowsay-checkbuffer)

;; Set font to source code pro

(when window-system
  (set-face-attribute 'default nil
                      :family "Source Code Pro for Powerline"
                      :height 115
                      :weight 'normal))

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
