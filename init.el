
(defconst *hbb-root-dir* (file-name-as-directory user-emacs-directory))
(defconst *hbb-modules-dir* (concat *hbb-root-dir* "modules/"))
(defconst *hbb-local-dir* (concat *hbb-root-dir* "local/"))
(defconst *hbb-cache-dir* (concat *hbb-root-dir* "cache/"))

(defconst hbb-modules
  '(bootstrap defaults editor ui tabs completion vc meow vterm org prog lisp web rss)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("572a3708f7414f55b59ddb38e863e209a3f5f0445e2dfe20e85d06555d37a6e9" "0f8333cde07c18c2bd7c8dcbcaad1fa9c253072c8f85e928b61a72c422af6088" "0ac50d6c41ad447ffa154d520625bfc06b279434a425ff97ae0c8acfb3221b0c" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
