;;; hbb-completion.el ---                            -*- lexical-binding: t; -*-

(use-package cape
  :straight t
  :config
  (add-to-list 'completion-at-point-functions #'cape-file) ;; complete file names
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-ispell)
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(use-package corfu
  :straight t
  :custom
  (corfu-auto t) ; Enable auto completion
  (corfu-cycle t) ; Allows cycling through candidates
  (corfu-min-width 25)
  (corfu-auto-delay 0.2)
  (corfu-echo-documentation nil)
  :config
  (defun +corfu-enable-in-minibuffer ()
    "Enable Corfu in the minibuffer if `completion-at-point' is bound."
    (when (where-is-internal #'completion-at-point (list (current-local-map)))
      (setq-local corfu-auto nil) ;; Enable/disable auto completion
      (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'+corfu-enable-in-minibuffer)
  (global-corfu-mode 1))

(use-package corfu-doc
  :straight t
  :hook (corfu-mode . corfu-doc-mode)
  :custom
  (corfu-doc-auto t)
  (corfu-doc-delay 0.1)
  (corfu-doc-max-height 15)
  :config
  (define-key corfu-map (kbd "M-p") #'corfu-doc-scroll-down)
  (define-key corfu-map (kbd "M-n") #'corfu-doc-scroll-up)
  (define-key corfu-map (kbd "M-d") #'corfu-doc-toggle))

(use-package kind-icon
  :straight t
  :after corfu
  :custom
  (kind-icon-default-style ;; Fix the scaling/height
   '(:padding 0 :stroke 0 :margin 0 :radius 0 :height 0.8 :scale 1.05))
  (kind-icon-use-icons t)
  (kind-icon-default-face 'corfu-default) ; Have background color be the same as `corfu' face background
  (kind-icon-blend-background nil) ; Use midpoint color between foreground and background colors ("blended")?
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)) ; Enable `kind-icon'

(use-package embark
  :straight t
  :config
  (setq prefix-help-command #'embark-prefix-help-command)
  (global-set-key [remap describe-bindings] #'embark-bindings)
  (global-set-key (kbd "C-.") 'embark-act))

(use-package embark-consult
  :straight t
  :after embark consult)

(use-package all-the-icons-completion
  :straight t
  :after marginalia
  :hook ((marginalia-mode-hook . all-the-icons-completion-marginalia-setup)))

(use-package marginalia
  :straight t
  :config
  (marginalia-mode 1))

(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :straight t
  :init
  (add-to-list
   'load-path
   (concat straight-base-dir
           (format "straight/%s/vertico/extensions" straight-build-dir)))
  :custom
  (vertico-cycle t)
  (vertico-resize nil)
  (vertico-count 12)
  :config
  (vertico-mode 1))

(use-package vertico-directory
  :after vertico
  :custom
  (vertico-buffer-display-action
   `(display-buffer-at-bottom
     (window-height . ,(+ 3 vertico-count))))
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package vertico-repeat
  :after vertico
  :hook ((minibuffer-setup-hook . vertico-repeat-save)))

(use-package mini-popup
  :straight (:host github :repo "minad/mini-popup")
  :after vertico
  :config
  (defun mini-popup-height-resize ()
    (* (1+ (min vertico--total vertico-count)) (default-line-height)))
  (defun mini-popup-height-fixed ()
    (* (1+ (if vertico--input vertico-count 0)) (default-line-height)))
  (setq mini-popup--height-function #'mini-popup-height-fixed)
  (advice-add
   #'vertico--resize-window :around
   (defun +mini-popup--disable-resizing-minibuffer-a (&rest args)
     (unless mini-popup-mode
       (apply args))))
  (add-hook
   'consult--completion-refresh-hook
   (defun +consult--update-after-refresh-h (&rest _)
     (mini-popup--setup))
   99))

(use-package consult
  :straight t
  :bind
  (("C-c b l" . #'consult-line)
   ("C-c s s" . #'consult-ripgrep)
   ("C-c s c" . #'consult-find)
   ("C-c b b" . #'consult-buffer)
   ("C-c f r" . #'consult-recent-file)
   ("C-c i y" . #'consult-yank-pop))
  :config
  (setq-default completion-in-region-function #'consult-completion-in-region))

(provide 'hbb-completion)
;;; hbb-completion.el ends here
