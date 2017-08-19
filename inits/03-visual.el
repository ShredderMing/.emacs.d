(when window-system
  (fringe-mode 0)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (toggle-scroll-bar nil)
  (set-frame-size (selected-frame) 100 30))

(defun set-ch-font (font)
  (when (display-graphic-p)
    (set-fontset-font
     (frame-parameter nil 'font)
     'chinese-gb2312
     `(,font . "iso10646-1"))))

(add-hook 'window-setup-hook
	  (lambda ()
	    (custom-set-faces
	     '(default (( t (:height 120 :family "Menlo")))))
	    (set-ch-font "PingFang SC")))
