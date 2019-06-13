;;; init.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; live with emacs

;;; Code:

;; 提高垃圾回收阀值，提高加载速度
(setq gc-cons-threshold (* 500 1024 1024))

;; 加载主配置文件
(org-babel-load-file (concat user-emacs-directory "config.org") t)

;; 还原垃圾回收阀值
(add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))

;;; init.el ends here
