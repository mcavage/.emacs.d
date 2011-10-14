(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x \\") 'align-regexp)
(global-set-key (kbd "C-c n") 'cleanup-buffer)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Indentation help
(global-set-key (kbd "C-x ^") 'join-line)
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Start proced in a similar manner to dired
(global-set-key (kbd "C-x p") 'proced)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; Should be able to eval-and-replace anywhere.
(global-set-key (kbd "C-c e") 'eval-and-replace)

(global-set-key (kbd "C-x g") 'magit-status)

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; cycle through buffers
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;; duplicate the current line or region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; rename buffer & visited file
(global-set-key (kbd "C-c r") 'rename-file-and-buffer)

;; open an ansi-term buffer
(global-set-key (kbd "C-x t") 'visit-term-buffer)

;; search with google
(global-set-key (kbd "C-c g") 'google)

;; toggle menu-bar visibility
(global-set-key (kbd "<f12>") 'menu-bar-mode)

;; mimic popular IDEs binding, note that it doesn't work in a terminal session
(global-set-key [(shift return)] 'insert-empty-line)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-o" 'find-file)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)

(global-set-key [(control up)] 'backward-paragraph)
(global-set-key [(control down)] 'forward-paragraph)
(global-set-key [(meta right)] 'forward-sexp)
(global-set-key [(meta left)] 'backward-sexp)

(global-set-key (kbd "M-<up>") 'move-line-region-up)
(global-set-key (kbd "M-<down>") 'move-line-region-down)

(provide 'keybindings
)
