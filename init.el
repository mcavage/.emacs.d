(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") "://melpa.org/packages/")))
  (add-to-list 'package-archives
	       '("melpa-stable" . "https://stable.melpa.org/packages/") t))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
(custom-set-variables
 '(jsx-cmd-options (quote ("--add-search-path" "/path/to/search-path")))
 '(jsx-indent-level 2)
 '(jsx-syntax-check-mode "compile")
 '(jsx-use-flymake t)
 '(package-selected-packages
   (quote
    (web-mode markdown-mode rjsx-mode jsx-mode rust-mode auto-complete exec-path-from-shell go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defvar myemacs-dir (file-name-directory load-file-name))
(defvar languages-dir (concat myemacs-dir "languages/"))
(defvar modules-dir (concat myemacs-dir "modules/"))

(add-to-list 'load-path languages-dir)
(add-to-list 'load-path modules-dir)

(require 'core)
(require 'editor)
(require 'keybindings)
(require 'ui)

(require 'lang-c)
(require 'lang-go)
(require 'lang-js)
(require 'lang-markdown)
(require 'lang-yaml)

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
