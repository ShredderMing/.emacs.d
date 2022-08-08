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

(setq straight-use-package-by-default t
      use-package-compute-statistics t)

(setq make-backup-files nil)

(use-package startup
  :straight nil
  :init
  (defun hbb/open-config ()
    "open init.el"
    (interactive)
    (find-file user-init-file))
  :bind
  (("C-`" . hbb/open-config))
  :custom
  (inhibit-startup-screen t)
  (inhibit-startup-message t)
  (inhibit-splash-screen t)
  (inhibit-startup-echo-area-message t)
  (initial-scratch-message (concat ";; Happy hacking, "
				   user-login-name " - Emacs ♥ you!\n\n"))
  )

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

(setq gc-cons-threshold 100000000)

(provide 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("58d11fe3caac9fbde33c3a45e97ccc85caf29f8294646569cb9ffb97fc9e56d2" "56898e8526bcb557a9e32973a1783f56db775b99067fc3afbd205cd2ced49af7" "2896cfe93bb178ee4f699521d365c482e1a0acb3793ba701079221fe67d78c94" "5d18a391d8e8982cfc047b752789fec9e2c0777ccd8b2c1a3b27b9d41f15b3e5" "b0df2068e64d415ceb38a34fa47f5bbda6a4796b1e3a180b31d884fe5df82f97" "ffe2c97aac245b4c39d51dae6c3fc3f22d37abe95aa502541194e65baf885939" "b832612e0132b5447641618c4c03b284846a0fb235c772ac6ace886c6c7f4bfb" "7fa74a311d1b6c9c75f7bc8b3aefb3282749f5ef66171f6972d066f7326bcb45" "361534e724e2114d6af3a95f943fcfc30cdd56502f841b5a289e2f7fd8cbf526" "f075f473a4648a83a990efe9c1d390b5906e5fd9e78473a22674bc0c4b7f41bb" "053fee3a82ad4f97aa2b2eddf72715d02b480ea80110ac279e1c2dbb843ac905" "3c2d12555478251a8be0b8ca0cc5307f652506367014f8cb827c4b00fdc8d60c" "802c177a1c901693141bb01e5483850d79b9c0d89a5b6a227775a4b2c4acd682" "b19c0598a3105a02c4e76066c41e1346f4972a13b64800f417b94256e6cc9349" "02e97c23ce9a2e876ed74b9dbbe02b4eb8214fbfa6a766490f2dbfd918f1b66b" "335a010ff7b2e91b9c5b604592fd1f326e6adf388dab71e03f8973c765f8f93c" "7d66c21f6931b6fb7f4e37af8ecf264f66df9d2c55e22ec4d38bc4cf4a56887a" "c41ad149c55c4105a80cf7bd37d0f0c5253ddb5c6394a702bd2d1da893e9ea47" "2ae04acaf26d26edfc1660f5d1b11716d8e3e792da02fcc370fab200c254febc" "aed6ec369980539867623ff44e85f7d30d33f3e3e6323dc5771f5329d4d49146" "5934a07103024c634bfd709545f45c7b780bb9ec3abd230ae83157c88017bd1d" "69586616ff438a57cc55a269e919e18073a1324503b231b472155b2b72612f3f" "1a24b5bc0049ac2bf5c0a454cf911bc92ebd84207340ea639b8532ada93c8706" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t (:background "#eeeeec"))))
 '(git-gutter:added ((t (:background "#50fa7b"))))
 '(git-gutter:deleted ((t (:background "#ff79c6"))))
 '(git-gutter:modified ((t (:background "#f1fa8c"))))
 '(parenthesis ((t (:foreground "#dadcda")))))
