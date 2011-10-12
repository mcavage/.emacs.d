(tool-bar-mode -1)
(unless (string= system-type "darwin")
  (menu-bar-mode -1))
(blink-cursor-mode -1)
(setq inhibit-startup-screen t)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)
(line-number-mode t)
(column-number-mode t)
(setq visible-bell t)
(setq scroll-step 1)
(setq-default truncate-lines "t")
(setq-default inhibit-startup-message "t")
(setq font-lock-maximum-decoration t)
(setq query-replace-highlight t)
(setq search-highlight t)
(size-indication-mode t)
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq default-font "-apple-Consolas-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
(setq-default show-trailing-whitespace t)
(fset 'yes-or-no-p 'y-or-n-p)
(add-to-list 'custom-theme-load-path (concat myemacs-dir "themes/"))
(load-theme 'zenburn t)
(provide 'ui)
