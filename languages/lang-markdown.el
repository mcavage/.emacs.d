(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown$" . markdown-mode)
            (cons '("\\.md$" . markdown-mode) auto-mode-alist)))

(provide 'lang-markdown)
