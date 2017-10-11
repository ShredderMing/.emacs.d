(require-or-install 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
(evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag)
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq js-indent-level 2)
	    (electric-pair-mode t)))
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq js-indent-level 2)
            (electric-pair-mode t)))
