;;; early-init.el --- early-init.el  -*- lexical-binding: t; -*-

(setq gc-cons-threshold most-positive-fixnum
      package-enable-at-startup nil
      frame-inhibit-implied-resize nil
      frame-resize-pixelwise t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(push '(alpha . 95) default-frame-alist)
(advice-add #'x-apply-session-resources :override #'ignore)
