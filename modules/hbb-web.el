;;; hbb-web.el ---                                   -*- lexical-binding: t; -*-

(use-package typescript-mode
  :straight t
  :after tree-sitter
  :config
  (define-derived-mode typescript-tsx-mode typescript-mode
    "TypeScript TSX")
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-tsx-mode))
  (add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-mode . tsx)))

;(use-package tsi
;  :straight (:host github :repo "orzechowskid/tsi.el")
;  :after tree-sitter
;  :commands (tsi-typescript-mode tsi-json-mode tsi-css-mode)
;  :init
;  (add-hook 'typescript-mode-hook (lambda () (tsi-typescript-mode 1)))
;  (add-hook 'json-mode-hook (lambda () (tsi-json-mode 1)))
;  (add-hook 'css-mode-hook (lambda () (tsi-css-mode 1)))
;  (add-hook 'scss-mode-hook (lambda () (tsi-scss-mode 1))))

(provide 'hbb-web)
;;; hbb-web.el ends here
