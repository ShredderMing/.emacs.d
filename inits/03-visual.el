(require-or-install 'nlinum)
(setq nlinum-format " %2d ")
(when window-system
  (fringe-mode 0)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-scroll-bar nil)
  (set-frame-size (selected-frame) 100 30))

(add-hook 'window-setup-hook
 	  (lambda ()
 	    (custom-set-faces
 	     '(default (( t (:height 120 :family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :width normal))))
	     (set-fontset-font t 'han (font-spec :family "Hiragino Sans GB")))))
