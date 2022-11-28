
(defconst *hbb-root-dir* (file-name-as-directory user-emacs-directory))
(defconst *hbb-modules-dir* (concat *hbb-root-dir* "modules/"))
(defconst *hbb-local-dir* (concat *hbb-root-dir* "local/"))
(defconst *hbb-cache-dir* (concat *hbb-root-dir* "cache/"))

(defconst hbb-modules
  '(bootstrap defaults editor ui tabs completion vc meow vterm org prog lisp rss)
  "HBBEmacs enabled modules.")

(dolist (module hbb-modules)
  (message "Loading module \"%s\"" module)
  (let ((filename (concat *hbb-modules-dir* (format "hbb-%s.el" module))))
    (if (file-exists-p filename)
	      (load filename nil t)
      (message "Module \"%s\" not found!" module))))

(use-package gcmh
  :straight t
  :custom
  (gcmh-idle-delay 'auto)
  (gcmh-auto-idle-delay-factor 10)
  (gcmh-high-cons-threshold (* 16 1024 1024))
  :config
  (gcmh-mode 1))
