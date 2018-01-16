(defvar *emacs-config-directory* (file-name-directory load-file-name))

(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'load-path (expand-file-name "shredderming-color-theme-moe/" *emacs-config-directory*))
(add-to-list 'load-path (expand-file-name "inits/lib/" *emacs-config-directory*))

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (package-refresh-contents))
  (unless (package-installed-p package)
    (package-install package)))

(defun require-or-install (package)
  (or (require package nil t)
      (progn
       (package-install-with-refresh package)
       (require package))))

;; init-loader

(package-initialize)
(require-or-install 'init-loader)

(setq init-loader-show-log-after-init nil)

(init-loader-load
 (expand-file-name "inits/" *emacs-config-directory*))
