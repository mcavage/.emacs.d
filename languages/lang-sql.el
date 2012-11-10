(defun myemacs-sql-coding-hook ()
  (setq c-basic-offset 8)
  (myemacs-coding-hook))
(add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))
(add-hook 'c-mode-common-hook 'myemacs-sql-coding-hook)

(provide 'lang-sql)
