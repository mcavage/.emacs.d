(when (string= system-type "darwin")
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta))

(setq-default indent-tabs-mode nil)

(delete-selection-mode t)
(setq search-highlight t
      query-replace-highlight t)

(setq make-backup-files nil)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

;; smart indenting and pairing for all
(electric-pair-mode t)
(electric-indent-mode t)
;(electric-layout-mode t)

;; show-paren-mode: subtle highlighting of matching parens
(show-paren-mode t)
(setq show-paren-style 'parenthesis)

;; tramp, for sudo access
(require 'tramp)
;; keep in mind known issues with zsh - see emacs wiki
(setq tramp-default-method "ssh")

(set-default 'imenu-auto-rescan t)

;; flyspell-mode
(setq ispell-program-name "aspell" ; use aspell instead of ispell
      ispell-extra-args '("--sug-mode=ultra"))
;;(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)

;; (defun turn-on-flyspell ()
;;   "Force flyspell-mode on using a positive argument.  For use in hooks."
;;   (interactive)
;;   (flyspell-mode 1))

;; (add-hook 'message-mode-hook 'turn-on-flyspell)
;; (add-hook 'text-mode-hook 'turn-on-flyspell)

;; enable narrow to region
(put 'narrow-to-region 'disabled nil)

;; enabled auto-fill mode in text-mode and all related modes
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(provide 'editor)
