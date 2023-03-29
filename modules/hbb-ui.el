;;; hbb-ui.el ---                                    -*- lexical-binding: t; -*-

;; Font
;(set-fontset-font t 'unicode (font-spec :family "Noto Color Emoji" :size 24))
;(set-face-attribute 'default nil :font (font-spec :family "CamingoCode" :size 24))
(set-face-attribute 'default nil :font (font-spec :family "CaskaydiaCove Nerd Font" :size 24))
(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Noto Sans CJK SC" :size 24))


;; Cursor
(blink-cursor-mode 0)

;; Icon
(use-package all-the-icons
  :straight t
  :custom
  (all-the-icons-scale-factor 1.0)
  :config
  (add-to-list 'all-the-icons-extension-icon-alist
               '("ss" all-the-icons-fileicon "scheme"
                 :height 0.8
                 :face all-the-icons-red)))

;; Theme
;(use-package hbb-themes
;  :load-path "extensions/hbb-themes"
;  :config
;  (load-theme 'hbb-plain t))

(use-package doom-themes
  :straight t
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  (doom-themes-treemacs-theme "doom-colors")
  :custom-face
  (font-lock-keyword-face ((t (:bold t))))
  (font-lock-function-name-face ((t (:bold t))))
  :config
  (doom-themes-org-config)
  (doom-themes-treemacs-config)
  (load-theme 'doom-tokyo-night t)
  (set-cursor-color "#dc322f"))



;; Modeline
(use-package doom-modeline
  :straight t
  :custom
  (doom-modeline-height 24)
  (doom-modeline-bar-width 8)
  (doom-modeline-time-icon nil)
  (doom-modeline-buffer-encoding 'nondefault)
  (doom-modeline-unicode-fallback t)
  :config
  (doom-modeline-mode 1))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
