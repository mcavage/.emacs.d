(when (string= system-type "darwin")
  (setq mac-command-modifier 'super))

(global-set-key [(control h)] 'delete-backward-char)
(define-key input-decode-map "\e\e[A" [(meta up)])
(define-key input-decode-map "\e\e[B" [(meta down)])

(global-set-key "\C-cs" 'shell)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cl" 'linum-mode)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-cd" 'delete-region)
(global-set-key "\M-o" 'find-file)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)

(global-set-key [(meta up)]  'move-line-region-up)
(global-set-key [(meta down)]  'move-line-region-down)

(provide 'keybindings)
