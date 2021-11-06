(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(add-hook 'markdown-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
	     (setq fill-colum 80)
             ))

(provide 'lang-markdown)
