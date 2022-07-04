(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom (straight-use-package-by-default t))

(use-package startup
  :straight nil
  :defer t
  :init
  (defun hbb/open-config ()
    "open init.el"
    (interactive)
    (find-file user-init-file))
  :bind
  (("C-`" . 'hbb/open-config))
  :custom
  (inhibit-startup-screen t)
  (inhibit-startup-message t)
  (inhibit-splash-screen t)
  (inhibit-startup-echo-area-message t)
  (initial-scratch-message (concat ";; Happy hacking, "
				   user-login-name " - Emacs ♥ you!\n\n"))
  (menu-bar-mode nil)
  (tool-bar-mode nil)
  (scroll-bar-mode nil))

(use-package recentf
  :straight nil
  :custom
  (recentf-max-menu-items 25)
  (recentf-max-saved-items 25)
  :config
  (recentf-mode))

(use-package hbb-ui
  :straight nil
  :load-path "config/ui/")
(use-package hbb-editor
  :straight nil
  :load-path "config/editor/")
(use-package hbb-lang
  :straight nil
  :load-path "config/lang/")
(use-package hbb-org
  :straight nil
  :load-path "config/org/")
(use-package hbb-completion
  :straight nil
  :load-path "config/")
(use-package hbb-meow
  :straight nil
  :load-path "config/")
(use-package hbb-dict
  :straight nil
  :load-path "config/")
(use-package hbb-proxy
  :straight nil
  :load-path "config/")
(use-package hbb-shortcuts
  :straight nil
  :load-path "config/")
(use-package hbb-vterm
  :straight nil
  :load-path "config/")
(use-package hbb-projectile
  :straight nil
  :load-path "config/")
(use-package hbb-spell
  :straight nil
  :load-path "config/")

