(require-or-install 'web-mode)

(add-to-list 'auto-mode-alist '("\\.\\(html?\\|emb\\|tmpl\\|tt\\)$" . web-mode))

(add-hook 'web-mode-hook
	  (lambda ()
	    (setq web-mode-markup-indent-offset 2)
	    (setq web-mode-code-indent-offset 2)
	    (setq web-mode-attr-indent-offset 2)
	    (setq web-mode-css-indent-offset 2) ))
