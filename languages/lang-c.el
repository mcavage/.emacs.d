(defun myemacs-c-coding-hook ()
  (setq c-basic-offset 8)
  (myemacs-coding-hook))

;; this will affect all modes derived from cc-mode, like
;; java-mode, php-mode, etc
(add-hook 'c-mode-common-hook 'myemacs-c-coding-hook)

(provide 'lang-c)
