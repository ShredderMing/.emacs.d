;;; init.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; live with Emacs

;;; Code:

;; 提高垃圾回收阀值，提高加载速度
(setq gc-cons-threshold most-positive-fixnum
      garbage-collection-messages t)

;; 加载主配置文件
(org-babel-load-file (concat user-emacs-directory "config.org"))

(defmacro k-time (&rest body)
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

(setq gc-cons-threshold #x20000000)

(defvar k-gc-timer
  (run-with-idle-timer 15 t
		       (lambda ()
			 (message "GC: %.02fs"
				  (k-time (garbage-collect))))))


;;; init.el ends here
