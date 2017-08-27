(require-or-install 'rjsx-mode)
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
(evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag)
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq js-indent-level 2)
            (electric-pair-mode t)
            (auto-complete-mode t);;虽然(global-auto-complete-mode t)，但是没效果。
            ))
