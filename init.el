;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                       ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))
  (require 'leaf)
  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get
      :ensure t
      :custom
      ((el-get-git-shallow-clone . t)))
    (leaf blackout :ensure t)
    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init))
  )
;; </leaf-install-code>

(leaf startup
  :init
  (defun hbb/open-config ()
    "open init.el"
    (interactive)
    (find-file user-init-file))
  :bind
  (("C-`" . 'hbb/open-config))
  :custom
  `((inhibit-startup-screen . t)
    (inhibit-startup-message . t)
    (inhibit-splash-screen . t)
    (inhibit-startup-echo-area-message . t)
    (initial-scratch-message . ,(concat ";; Happy hacking, "
					user-login-name " - Emacs ♥ you!\n\n"))
    (menu-bar-mode . nil)
    (tool-bar-mode . nil)
    (scroll-bar-mode . nil)))

(leaf recentf
  :custom
  ((recentf-max-menu-items . 25)
   (recentf-max-saved-items . 25))
  :global-minor-mode t)

(leaf ui
  :load-path* "config/ui"
  :require t)

(leaf hbb-editor
  :load-path* "config/editor"
  :require t)

(leaf hbb-lang
  :load-path* "config/lang"
  :require t)

(leaf completion
  :load-path* "config"
  :require t)

(leaf hbb-meow
  :load-path* "config"
  :require t)

(leaf hbb-org
  :load-path* "config/org"
  :require t)

(leaf hbb-dict
  :load-path* "config"
  :require t)

(leaf hbb-proxy
  :load-path* "config"
  :require t)

(leaf hbb-shortcuts
  :load-path* "config"
  :require t)

(leaf hbb-vterm
  :load-path* "config"
  :require t)

(leaf hbb-projectile
  :load-path* "config"
  :require t)
