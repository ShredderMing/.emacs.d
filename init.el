;;; init.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; live with Emacs

;;; Code:

;; 提高垃圾回收阀值，提高加载速度
(setq gc-cons-threshold most-positive-fixnum)

;; 加载主配置文件
(org-babel-load-file (concat user-emacs-directory "config.org"))

(defvar gc-max (* 500 1024 1024))
(defvar gc-min (* 200 1024 1024))

(add-hook 'minibuffer-setup-hook (lambda () (setq gc-cons-threshold gc-max)))
(add-hook 'minibuffer-exit-hook (lambda () (setq gc-cons-threshold gc-min)))

(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold gc-min)))

;;; init.el ends here
