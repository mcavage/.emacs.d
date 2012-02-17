;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell. If you're using homebrew modifying the PATH is essential.
(if (string= system-type "darwin")
    (push "/usr/local/bin" exec-path))

(defvar myemacs-dir (file-name-directory load-file-name))
(defvar languages-dir (concat myemacs-dir "languages/"))
(defvar modules-dir (concat myemacs-dir "modules/"))
(defvar vendor-dir (concat myemacs-dir "vendor/"))
(defvar personal-dir (concat myemacs-dir "personal/"))

(add-to-list 'load-path languages-dir)
(add-to-list 'load-path modules-dir)
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path personal-dir)

;; the core stuff
(require 'ui)
(require 'packages)
(require 'core)
(require 'editor)
(require 'keybindings)

;; programming & markup languages support
(require 'lang-c)
(require 'lang-dtrace)
(require 'lang-js)
(require 'lang-markdown)
(require 'lang-perl)
(require 'lang-ruby)
(require 'lang-xml)

;; load the personal settings
(when (file-exists-p personal-dir)
  (mapc 'load (directory-files personal-dir nil "^[^#].*el$")))
;; config changes made through the customize UI will be store here
(setq custom-file (concat personal-dir "custom.el"))


(defun set-js-indent-two()
  (interactive)
  (setq js-indent-level 2)
  )

(defun set-js-indent-four()
  (interactive)
  (setq js-indent-level 4)
  )

(global-set-key (kbd "C-c j 2") 'set-js-indent-two)
(global-set-key (kbd "C-c j 4") 'set-js-indent-four)

(setq enable-local-variables :all)
