(require-or-install 'markdown-mode)
;; Arch linux install multimarkdown from aur
;; yaourt -S multimarkdown
(setq markdown-command "multimarkdown")
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
