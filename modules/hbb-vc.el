;;; hbb-vc.el ---                                    -*- lexical-binding: t; -*-

(use-package magit
  :straight t
  :bind ("C-M-g" . magit-status)
  :custom
  (magit-diff-refine-hunk t)
  (magit-revision-show-gravatars t)
  (magit-save-repository-buffers nil)
  (magit-display-buffer-function 'magit-display-buffer-fullcolumn-most-v1))

(provide 'hbb-vc)
;;; hbb-vc.el ends here
