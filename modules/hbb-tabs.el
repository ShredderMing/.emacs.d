;;; hbb-tabs.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Harry

;; Author: Harry <harry@SummerTear>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(use-package centaur-tabs
  :straight t
  :demand
  :hook ((dashboard-mode
          term-mode
          calendar-mode
          org-agenda-mode
          helpful-mode) .centaur-tabs-local-mode)
  :bind (("s-{" . centaur-tabs-backward)
         ("s-}" . centaur-tabs-forward))
  :custom
  (centaur-tabs-height 32)
  (centaur-tabs-style "bar")
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-bar 'under)
  (x-underline-at-descent-line t)
  (centaur-tabs-set-close-button nil)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-modified-marker "●")
  :config
  (centaur-tabs-headline-match)
  (centaur-tabs-mode t)
  (setq uniquify-separator "/"
        uniquify-buffer-name-style 'forward)
  (defun centaur-tabs-buffer-groups ()
    (list (cond
           ((or (string-equal "*" (substring (buffer-name) 0 1))
                (memq major-mode '(magit-process-mode
                                   magit-status-mode
                                   magit-diff-mode
                                   magit-log-mode
                                   magit-file-mode
                                   magit-blob-mode
                                   magit-blame-mode)))
            "Emacs")
           ((derived-mode-p 'prog-mode)
            "Editing")
           ((derived-mode-p 'dired-mode)
            "Dired")
           ((memq major-mode '(helpful-mode
                               help-mode))
            "Help")
           ((memq major-mode '(org-mode
                               org-agenda-clockreport-mode
                               org-src-mode
                               org-agenda-mode
                               org-beamer-mode
                               org-indent-mode
                               org-bullets-mode
                               org-cdlatex-mode
                               org-agenda-log-mode
                               diary-mode))
            "OrgMode")
           (t
            (centaur-tabs-get-group-name (current-buffer)))))))

(provide 'hbb-tabs)
;;; hbb-tabs.el ends here
