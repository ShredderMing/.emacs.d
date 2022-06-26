;;; early-init.el --- early-init.el  -*- lexical-binding: t; -*-

(setq
 ad-redefinition-action            'accept
 auto-mode-case-fold               nil
 fast-but-imprecise-scrolling      t
 ffap-machine-p-known              'reject
 gc-cons-percentage                1.0
 gc-cons-threshold                 most-positive-fixnum
 idle-update-delay                 1
 inhibit-compacting-font-caches    t
 inhibit-default-init              t
 initial-major-mode                'fundamental-mode
 load-prefer-newer                 t
 native-comp-async-jobs-number     32
 package-enable-at-startup         nil
 read-process-output-max           #x10000
 redisplay-skip-fontification-on-input    t
 ;; visible-bell t
 native-comp-async-report-warnings-errors 'silent
 backup-directory-alist `(("." . ,(locate-user-emacs-file "backups")))
 custom-file (locate-user-emacs-file "custom.el")
 default-frame-alist '((width . 80) (height . 45)))

(let ((old-file-name-handler-alist file-name-handler-alist))

  (setq-default file-name-handler-alist nil)

  (defun restore-default ()
    "Restore gc setting to default."
    (setq file-name-handler-alist
          (delete-dups
           (append file-name-handler-alist
                   old-file-name-handler-alist))))

  (add-hook 'emacs-startup-hook #'restore-default))

(set-language-environment "UTF-8")
(setq selection-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)
