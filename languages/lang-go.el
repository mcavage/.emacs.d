(defvar go-dir "/Users/mcavage/dev/go")

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(add-hook 'go-mode-hook
          '(lambda ()
             (setq js-indent-level 8)
	     (setq fill-colum 120)
             (setq indent-tabs-mode t)
             (setq js-auto-indent-flag nil)
	     (defun set-exec-path-from-shell-PATH ()
	       (let ((path-from-shell (replace-regexp-in-string
				       "[ \t\n]*$"
				       ""
				       (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
		 (setenv "PATH" path-from-shell)
		 (setq eshell-path-env path-from-shell) ; for eshell users
		 (setq exec-path (split-string path-from-shell path-separator))))

	     (when window-system (set-exec-path-from-shell-PATH))
	     (setenv "GOPATH" go-dir)
	     (add-to-list 'exec-path  (concat go-dir "bin"))
	     (add-hook 'before-save-hook 'gofmt-before-save)
	     (defun my-go-mode-hook ()
	       (add-hook 'before-save-hook 'gofmt-before-save)
	       (local-set-key (kbd "M-.") 'godef-jump)
	       (local-set-key (kbd "M-*") 'pop-tag-mark)
	       )
	     (add-hook 'go-mode-hook 'my-go-mode-hook)
	     (defun auto-complete-for-go ()
	       (auto-complete-mode 1))
	     (add-hook 'go-mode-hook 'auto-complete-for-go)
	     (with-eval-after-load 'go-mode
	       (require 'go-autocomplete))

             ))

(provide 'lang-go)



;; (defun set-exec-path-from-shell-PATH ()
;;  (let ((path-from-shell (replace-regexp-in-string
;;                          "[ \t\n]*$"
;;                          ""
;;                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;    (setenv "PATH" path-from-shell)
;;    (setq eshell-path-env path-from-shell) ; for eshell users
;;    (setq exec-path (split-string path-from-shell path-separator))))
