;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                       ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                       ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)
    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

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

(leaf startup
  :custom
  `((inhibit-startup-screen . t)
    (inhibit-startup-message . t)
    (inhibit-splash-screen . t)
    (inhibit-startup-echo-area-message . t)
    (initial-scratch-message . ,(concat ";; Happy hacking, "
					user-login-name " - Emacs ♥ you!\n\n")))
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(leaf ui
  :load-path* "config/ui"
  :require t)

(leaf editor
  :load-path* "config/editor"
  :require t)

(leaf lang
  :load-path* "config/lang"
  :require t)

(leaf completion
  :load-path* "config"
  :require t)

(leaf hbb-meow
  :load-path* "config"
  :require t)
