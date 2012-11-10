(setq make-backup-files nil)
(setq enable-local-variables :all)
(setq grep-command "grep -rni ")

(when (string= system-type "darwin")
  (defun mac-copy ()
    (shell-command-to-string "pbpaste"))

  (defun mac-paste (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
	(process-send-string proc text)
	(process-send-eof proc))))

  (setq interprogram-cut-function 'mac-paste)
  (setq interprogram-paste-function 'mac-copy)
)




;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; like electric mode
(require 'autopair)
(autopair-global-mode)

;; show-paren-mode: subtle highlighting of matching parens
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq linum-format "%d ")
(global-linum-mode t)
(pc-selection-mode)

(setq auto-mode-alist
      '(
        ("\\.py$"       . python-mode)
        ("\\.pl$"       . perl-mode)
        ("\\.c$"        . c-mode)
        ("\\.cc$"       . c++-mode)
        ("\\.cpp$"      . c++-mode)
        ("\\.java$"     . java-mode)
        ("\\.js$"       . js-mode)
        ("\\.s$"        . asm-mode)
        ("\\.S$"        . asm-mode)
        ("\\.h$"        . c-mode)
        ("\\.hpp$"      . c++-mode)
        ("\\.awk$"      . awk-mode)
        ("\\.el$"       . emacs-lisp-mode)
        ("\\.html$"     . html-mode)
        ("\\.xml$"      . xml-mode)
        ("\\.mk$"       . makefile-mode)
        ("Makefile"     . makefile-mode)
        ))

(require 'fill-column-indicator)

(defun my-enable-minor-modes ()
  "Enables several minor modes."
  (setq fci-rule-column 80)
  (fci-mode 1))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default fill-column 80)
(provide 'editor)
