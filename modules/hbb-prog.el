;;; hbb-prog.el ---                                  -*- lexical-binding: t; -*-

(use-package tree-sitter
  :straight t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)

(use-package apheleia
  :straight t
  :config
  (dolist (mode '(emacs-lisp-mode lisp-data-mode scheme-mode))
    (push (cons mode 'lisp-indent) apheleia-mode-alist))
  (apheleia-global-mode +1))

(provide 'hbb-prog)
;;; hbb-prog.el ends here
