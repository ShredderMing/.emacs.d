;; Use UTF-8.
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq initial-major-mode 'emacs-lisp-mode)

(fset 'yes-or-no-p 'y-or-n-p)

;; Show key strokes in minibuffer quickly.
(setq echo-keystrokes 0.1)

;; Prevent beeping.
(setq ring-bell-function 'ignore)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; ensure environment variables inside Emacs look the same as in the user's shell.
(require-or-install 'exec-path-from-shell)
(exec-path-from-shell-initialize)

