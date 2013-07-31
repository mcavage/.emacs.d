(defvar myemacs-dir (file-name-directory load-file-name))
(defvar languages-dir (concat myemacs-dir "languages/"))
(defvar modules-dir (concat myemacs-dir "modules/"))
(defvar vendor-dir (concat myemacs-dir "vendor/"))

(add-to-list 'load-path languages-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)

(if (fboundp 'pc-selection-mode)
    (pc-selection-mode)
  (require 'pc-select))

(require 'core)
(require 'editor)
(require 'keybindings)
(require 'ui)

(require 'lang-c)
(require 'lang-dtrace)
(require 'lang-js)
(require 'lang-markdown)
(require 'lang-yaml)
(require 'lang-xml)

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((js-mode "<script.*>" "</script>")))
(setq mweb-filename-extensions '("html"))
(multi-web-global-mode 1)
(delete-selection-mode 1)
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

(setq fill-colum 80)
