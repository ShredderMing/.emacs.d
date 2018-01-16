(require 'org)
(require 'ob)

;; make org mode allow eval of some langs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (lisp . t)
   (scheme . t)
   (C . t)
   (js . t)))
