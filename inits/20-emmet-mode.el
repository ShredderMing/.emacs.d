(require-or-install 'emmet-mode)

(define-key emmet-mode-keymap (kbd "<C-tab>") 'emmet-expand-line)
(add-hook 'web-mode-hook 'emmet-mode)
