;;; hbb-ui.el ---                                    -*- lexical-binding: t; -*-

;; Font
(progn
  (set-face-attribute 'default nil
                      :font (font-spec :family "CaskaydiaCove Nerd Font Mono" :size 16))
  (set-fontset-font t 'unicode
                    (font-spec :family "Noto Color Emoji" :size 16) nil 'prepend))

(defun hbb/set-cjk-font (fontFamily fontSize)
  (interactive)
  (set-fontset-font t '(#x2ff0 . #x9ffc)
                    (font-spec :family fontFamily :size fontSize) nil 'prepend))

(hbb/set-cjk-font "Noto Sans CJK SC" 16)

;; Cursor
(blink-cursor-mode 0)

;; Theme
(use-package hbb-themes
  :load-path "extensions/hbb-themes"
  :config
  (load-theme 'hbb-plain t))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
