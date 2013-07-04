(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(add-hook 'js-mode-hook
          '(lambda ()
             (setq js-indent-level 4)
             (setq indent-tabs-mode nil)
             (setq js-auto-indent-flag nil)
             ))

(provide 'lang-js)