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
;; (require 'autopair)
;; (autopair-global-mode)
(defun electric-pair ()
      "If at end of line, insert character pair without surrounding spaces.
    Otherwise, just insert the typed character."
      (interactive)
      (if (eolp) (let (parens-require-spaces) (insert-pair)) (self-insert-command 1)))

;; show-paren-mode: subtle highlighting of matching parens
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

(setq linum-format "%d ")
(global-linum-mode t)

(setq auto-mode-alist
      '(
	("\\.bashrc$"   . shell-script-mode)
        ("\\.py$"       . python-mode)
        ("\\.pl$"       . perl-mode)
        ("\\.c$"        . c-mode)
        ("\\.cc$"       . c++-mode)
        ("\\.cpp$"      . c++-mode)
	("\\.go$"       . go-mode)
        ("\\.java$"     . java-mode)
        ("\\.js$"       . js-mode)
        ("\\.s$"        . asm-mode)
        ("\\.S$"        . asm-mode)
        ("\\.h$"        . c-mode)
        ("\\.hpp$"      . c++-mode)
        ("\\.awk$"      . awk-mode)
        ("\\.el$"       . emacs-lisp-mode)
        ; ("\\.html$"     . html-mode)
        ("\\.xml$"      . xml-mode)
        ("\\.mk$"       . makefile-mode)
        ("Makefile"     . makefile-mode)
        ))


;; Set files to TEXT mode so they automatically open in Emacs and can
;; be indexed by spotlight, and open & reconvert binary plists.
;; ron@18james.com, 16 Jun 2005
(when (string= system-type "darwin")
  (setq default-major-mode  'text-mode)
  (add-hook 'after-save-hook 'save-as-mac-text)
  (push  '("\\.plist\\'" . simple-plist-hack) auto-mode-alist)

  (defun save-as-mac-text ()
    (cond
     ((and (derived-mode-p 'text-mode 'sh-mode)
	   (not (derived-mode-p 'sgml-mode)))
      (start-process-shell-command "save-mac-text" nil
				   "/Developer/Tools/SetFile" "-t" "TEXT"
				   (shell-quote-argument (buffer-file-name))))
     ((and (derived-mode-p 'sgml-mode)
	   (string= sgml-xml-mode "binary1"))
      (start-process-shell-command "save-as-binary" nil
				   "plutil" "-convert" sgml-xml-mode
				   (shell-quote-argument (buffer-file-name))))))

  (defun simple-plist-hack ()
    (when (string-match "^bplist" (buffer-string))
      (shell-command-on-region
       (point-min) (point-max)
       (format "plutil -convert xml1 -o /dev/stdout %s"
	       (shell-quote-argument (buffer-file-name)))
       t t))
    (xml-mode)
    (save-excursion
      (goto-char (point-max))
      (previous-line 1)
      (when (looking-at "/dev/stdout: Operation not supported")
	(progn
	  (kill-line 1)
	  (setq sgml-xml-mode "binary1")))
      (set-buffer-modified-p nil))))

(provide 'editor)
