(require-or-install 'helm)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "M-x") 'helm-M-x)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)   ; make TAB works in terminal
(define-key helm-map (kbd "C-z") 'helm-select-action)               ; list actions using C-z
(define-key helm-map "\C-j" 'helm-next-line)
(define-key helm-map "\C-k" 'helm-previous-line)
(define-key helm-map "\M-j" 'helm-next-page)
(define-key helm-map "\M-k" 'helm-previous-page)

(helm-mode 1)
