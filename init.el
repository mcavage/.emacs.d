(defvar myemacs-dir (file-name-directory load-file-name))
(defvar languages-dir (concat myemacs-dir "languages/"))
(defvar modules-dir (concat myemacs-dir "modules/"))
(defvar vendor-dir (concat myemacs-dir "vendor/"))

(add-to-list 'load-path languages-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)

(require 'core)
(require 'editor)
(require 'keybindings)
(require 'ui)

(require 'lang-c)
(require 'lang-dtrace)
(require 'lang-js)
(require 'lang-markdown)
(require 'lang-xml)
