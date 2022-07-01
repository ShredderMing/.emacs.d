;;; theme.el --- theme                               -*- lexical-binding: t; -*-

;; Copyright (C) 2022  xlmx

;; Author: xlmx <xlmx@SummerTear>
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

(leaf twilight-bright-theme
  :ensure t)

(leaf doom-themes
  :ensure t
  :custom ((doom-themes-enable-italic . t)
           (doom-themes-enable-bold . t)
	   (doom-themes-treemacs-theme . "doom-colors")
           (doom-challenger-deep-brighter-comments . t)
           ;; (doom-monokai-brighter-comments . t)
           ;; (doom-dracula-brighter-comments . t)
	   )
  :custom-face (;; (line-number . '((t (:foreground "#757878"))))
                ;; (ivy-virtual . '((t (:foreground "#FF6188"))))
		(org-block . '((t (:background nil))))
		(org-block-begin-line . '((t (:background nil))))
		(org-block-end-line . '((t (:background nil))))
		;; (show-paren-match-expression . '((t (:background "#ebedeb"))))
		)
  :config
  (doom-themes-org-config)
  (doom-themes-treemacs-config)
  (load-theme 'doom-material-dark t)
  )

;;(leaf lambda-themes
;;  :el-get lambda-emacs/lambda-themes
;;  :custom
;;  ((lambda-themes-set-italic-comments . t)
;;   (lambda-themes-set-italic-keywords . t)
;;   (lambda-themes-set-variable-pitch . t)))

;;(leaf solo-jazz-theme
;;  :ensure t)

(provide 'theme)
;;; theme.el ends here
