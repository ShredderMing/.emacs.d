;;; hbb-ui.el ---                                    -*- lexical-binding: t; -*-

;; Font
(progn
  (set-face-attribute 'default nil :font (font-spec :family "Ubuntu Mono Nerd Font" :size 16))
  (set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Noto Sans CJK SC" :size 16))
  (set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" :size 24)))

;; Cursor
(blink-cursor-mode 0)

;; Icon
(use-package all-the-icons
  :straight t
  :config
  (add-to-list 'all-the-icons-extension-icon-alist
               '("ss" all-the-icons-fileicon "scheme"
                 :height 0.8
                 :face all-the-icons-red)))

;; Theme
(use-package hbb-themes
  :load-path "extensions/hbb-themes"
  :config
  (load-theme 'hbb-plain t))

;; Modeline
(use-package doom-modeline
  :straight t
  :custom
  (doom-modeline-height 24)
  (doom-modeline-bar-width 8)
  ;;  (doom-modeline-time-icon nil)
  ;;(doom-modeline-buffer-encoding 'nondefault)
  ;;(doom-modeline-unicode-fallback t)
  :config
  (doom-modeline-mode 1))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
