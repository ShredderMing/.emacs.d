;;; early-init.el --- early-init.el  -*- lexical-binding: t; -*-

(setq gc-cons-threshold (* 2 1024 1024 1024)
      load-prefer-newer t
      package-enable-at-startup nil
      inhibit-startup-message t)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
;;(push '(left-fringe . 0) default-frame-alist)
;;(push '(right-fringe . 0) default-frame-alist)

;;(push '(alpha . 85) default-frame-alist)
