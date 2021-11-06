(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(defun my-jsx-init ()
  (setq js-indent-level 2)
  (setq fill-colum 80)
  (setq indent-tabs-mode nil)
  (setq js-auto-indent-flag nil))

(add-hook 'js-mode-hook 'my-jsx-init)

(provide 'lang-js)
