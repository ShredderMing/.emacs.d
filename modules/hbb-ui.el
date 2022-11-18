;;; hbb-ui.el ---                                    -*- lexical-binding: t; -*-

;; Font
(progn
  (set-face-attribute 'default nil
                      :font (font-spec :family "CaskaydiaCove Nerd Font" :size 14))
  (set-fontset-font t 'unicode
                    (font-spec :family "Noto Color Emoji" :size 14) nil 'prepend)
  (set-fontset-font t '(#x2ff0 . #x9ffc)
                    (font-spec :family "Noto Sans CJK SC" :size 14) nil 'prepend)
  )

;; Theme
(use-package hbb-themes
  :load-path "extensions/hbb-themes"
  :config
  (load-theme 'hbb-plain t))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
