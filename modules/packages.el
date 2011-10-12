(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; TODO find a way to get inf-ruby 2.2.2 into Marmalade
(defvar packages
  '(auctex coffee-mode deft gist magit markdown-mode paredit
           js2-mode sass-mode scss-mode yaml-mode yari)
  "A list of packages to ensure are installed at launch.")

(dolist (p packages)
  (when (not (package-installed-p p))
    (package-install p)))

(provide 'packages)
