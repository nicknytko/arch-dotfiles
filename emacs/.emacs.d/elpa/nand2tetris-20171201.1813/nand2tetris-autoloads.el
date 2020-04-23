;;; nand2tetris-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "nand2tetris" "nand2tetris.el" (0 0 0 0))
;;; Generated autoloads from nand2tetris.el

(defconst nand2tetris-mode-syntax-table (let ((table (make-syntax-table))) (modify-syntax-entry 47 ". 124b" table) (modify-syntax-entry 42 ". 23" table) (modify-syntax-entry 10 "> b" table) table))

(autoload 'nand2tetris//snippets-initialize "nand2tetris" "\
Initialize snippets directory.

\(fn)" nil nil)

(eval-after-load 'yasnippet #'(nand2tetris//snippets-initialize))

(autoload 'nand2tetris-mode "nand2tetris" "\
Major mode for editing HDL files for the course Nand2Tetris.

\\{nand2tetris-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist `(,(concat (expand-file-name nand2tetris-core-base-dir) ".*\\.hdl") quote nand2tetris-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nand2tetris" '("nand2tetris")))

;;;***

;;;### (autoloads nil "nand2tetris-core" "nand2tetris-core.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from nand2tetris-core.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "nand2tetris-core" '("nand2tetris-core-b")))

;;;***

;;;### (autoloads nil nil ("nand2tetris-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; nand2tetris-autoloads.el ends here
