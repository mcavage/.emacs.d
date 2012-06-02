(when (string= system-type "darwin")
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (defvar real-keyboard-keys
    '(("M-<up>"        . "\M-[1;9A")
      ("M-<down>"      . "\M-[1;9B"))
    ))
(when (string= system-type "usg-unix-v")
  (defvar real-keyboard-keys
    '(("M-<up>"         . "\M-[1;9A")
      ("M-<down>"      . "\M-[1;9B"))
    ))

(global-set-key "\C-cs" 'shell)
(global-set-key "\C-cg" 'grep)
(global-set-key "\C-cl" 'linum-mode)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-cd" 'delete-region)
(global-set-key "\M-o" 'find-file)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

(global-set-key (read-kbd-macro "<M-DEL>") 'backward-delete-word)


(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key (key "M-<up>") 'move-line-region-up)
(global-set-key (key "M-<down>") 'move-line-region-down)

(provide 'keybindings)
