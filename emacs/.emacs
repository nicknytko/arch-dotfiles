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
    (scroll-bar-mode -1)
    (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin:/Library/TeX/texbin"))
    (setq exec-path (append exec-path '("/usr/local/bin")))
    (setq exec-path (append exec-path '("/Library/TeX/texbin")))
    )

(menu-bar-mode -1)

;; Tab mode

(setq c-default-style "bsd"
      c-basic-offset 4)

(setq-default indent-tabs-mode nil)

(setq tab-stop-list (number-sequence 4 60 4))

;; Line numbering

;; (add-to-list `load-path "~/.emacs.d/lisp/")
;; (require 'linum-off)
;; (setq mode-line-format nil)

;; (global-linum-mode t)
;; (setq linum-format "%4d\u2502")

(global-display-line-numbers-mode 1)

;; Disable annoying backup files

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Startup fortune

(defun cowsay-startup( )

  (when (eq system-type 'darwin)        ;; When on mac our fortune and cowsay are installed to /opt/homebrew/bin
    (defconst fortune-path "/opt/homebrew/bin/fortune")
    (defconst cowsay-path "/opt/homebrew/bin/cowsay")
    (setq mac-option-key-is-meta t)
    (setq mac-command-key-is-meta nil)
    (setq mac-command-modifier nil)
    (setq mac-option-modifier 'meta)
    )


  (unless (eq system-type 'darwin)
    (defconst fortune-path "/usr/bin/fortune")
    (defconst cowsay-path "/usr/bin/cowsay"))

  (defconst fortune (concat fortune-path " -a computers"))
  (defconst scrwidth ( - (frame-width (selected-frame)) 5 ))
  (defconst cowsay (concat cowsay-path " -W " (number-to-string(symbol-value `scrwidth))))

  (with-current-buffer (generate-new-buffer "cowsay-startup")
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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Set font to source code pro

(when window-system
  (set-face-attribute 'default nil
                      :family "Roboto Mono for Powerline";
                      :height 115
                      :weight 'normal))

;; Random variables
(setq enable-remote-dir-locals t)
;;(add-hook 'major-mode-hook 'pixel-scroll-precision-mode)
(pixel-scroll-precision-mode 1)

(add-to-list 'auto-mode-alist '("\\.cl\\'" . opencl-mode))

;; Andrew's lsp-mode settings
(use-package dap-mode :ensure t)
(use-package yasnippet
  :ensure t)

(use-package lsp-mode
  :ensure t
  :hook ((c++-mode . lsp-deferred)
		 (c-mode . lsp-deferred))
  :commands (lsp lsp-deferred))
(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(setq lsp-headerline-breadcrumb-enable nil)


;; Random emacs generated junk

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("3b1973119d3ca55a31abffd64cf6b7d12ce9de125ae07574dd43b90c5f9d5896"
     default))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(package-selected-packages
   '(lsp-latex lsp-ui dap-mode lsp-ivy lsp-mode cmake-mode opencl-mode
               cuda-mode yaml-mode format-all markdown-preview-mode
               markdown-mode magit mustache-mode slime clang-format
               lua-mode haskell-mode nand2tetris-assembler yasnippet
               nand2tetris enh-ruby-mode neotree web-mode
               company-irony irony dash-at-point websocket
               uncrustify-mode rust-mode powerline latex-preview-pane
               git fireplace auctex-latexmk))
 '(safe-local-variable-values
   '((c-offsets-alist (inexpr-class . +) (inexpr-statement . +)
                      (lambda-intro-cont . +)
                      (inlambda . c-lineup-inexpr-block)
                      (template-args-cont c-lineup-template-args +)
                      (incomposition . +) (inmodule . +)
                      (innamespace . +) (inextern-lang . +)
                      (composition-close . 0) (module-close . 0)
                      (namespace-close . 0) (extern-lang-close . 0)
                      (composition-open . 0) (module-open . 0)
                      (namespace-open . 0) (extern-lang-open . 0)
                      (objc-method-call-cont
                       c-lineup-ObjC-method-call-colons
                       c-lineup-ObjC-method-call +)
                      (objc-method-args-cont .
                                             c-lineup-ObjC-method-args)
                      (objc-method-intro . [0]) (friend . 0)
                      (cpp-define-intro c-lineup-cpp-define +)
                      (cpp-macro-cont . +) (cpp-macro . [0])
                      (inclass . +) (stream-op . c-lineup-streamop)
                      (arglist-cont-nonempty c-lineup-gcc-asm-reg
                                             c-lineup-arglist)
                      (arglist-cont c-lineup-gcc-asm-reg 0)
                      (arglist-intro . +) (catch-clause . 0)
                      (else-clause . 0) (do-while-closure . 0)
                      (label . 2) (access-label . -)
                      (substatement-label . 2) (substatement . +)
                      (statement-case-open . 0)
                      (statement-case-intro . +)
                      (statement-block-intro . +) (statement-cont . +)
                      (statement . 0) (brace-entry-open . 0)
                      (brace-list-entry . 0) (brace-list-intro . +)
                      (brace-list-close . 0) (brace-list-open . 0)
                      (block-close . 0)
                      (inher-cont . c-lineup-multi-inher)
                      (inher-intro . +)
                      (member-init-cont . c-lineup-multi-inher)
                      (member-init-intro . +)
                      (annotation-var-cont . +)
                      (annotation-top-cont . 0)
                      (topmost-intro-cont .
                                          c-lineup-topmost-intro-cont)
                      (topmost-intro . 0) (knr-argdecl . 0)
                      (func-decl-cont . +) (inline-close . 0)
                      (inline-open . +) (class-close . 0)
                      (class-open . 0) (defun-block-intro . +)
                      (defun-close . 0) (defun-open . 0)
                      (string . c-lineup-dont-change)
                      (arglist-close . c-lineup-arglist)
                      (substatement-open . 0) (case-label . 0)
                      (block-open . 0) (c . 2) (comment-intro . 0)
                      (knr-argdecl-intro . -))
     (c-cleanup-list scope-operator brace-else-brace
                     brace-elseif-brace brace-catch-brace
                     empty-defun-braces list-close-comma
                     defun-close-semi)
     (c-hanging-semi&comma-criteria
      c-semi&comma-no-newlines-before-nonblanks)
     (c-hanging-colons-alist (member-init-intro before) (inher-intro)
                             (case-label after) (label after)
                             (access-label after))
     (c-hanging-braces-alist (substatement-open after)
                             (brace-list-open after)
                             (brace-entry-open) (defun-open after)
                             (class-open after) (inline-open after)
                             (block-open after)
                             (block-close . c-snug-do-while)
                             (statement-case-open after)
                             (substatement after))
     (c-block-comment-prefix . "") (c-comment-only-line-offset . 0)
     (c-tab-always-indent . t) (intent-tabs-mode . t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq doc-view-resolution 200)
(setq markdown-preview-stylesheets (list "github-markdown.css"))
