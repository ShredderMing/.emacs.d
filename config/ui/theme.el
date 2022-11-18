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

;; (use-package twilight-bright-theme
;;   :config
;;   (load-theme 'twilight-bright t))

(defvar current-theme nil)

(use-package doom-themes
  :custom
  (doom-themes-enable-italic t)
  (doom-themes-enable-bold t)
  (doom-themes-treemacs-theme "doom-colors")
  :custom-face
  (org-block ((t (:background unspecified))))
  (org-block-begin-line ((t (:background unspecified))))
  (org-block-end-line ((t (:background unspecified))))
  (show-paren-match-expression ((t (:background "#ebedeb"))))
  :config
  (doom-themes-org-config)
  (doom-themes-treemacs-config)
  (load-theme 'doom-solarized-light t)
  (set-cursor-color "#dc322f")
  )

;;(leaf lambda-themes
;;  :el-get lambda-emacs/lambda-themes
;;  :custom
;;  ((lambda-themes-set-italic-comments . t)
;;   (lambda-themes-set-italic-keywords . t)
;;   (lambda-themes-set-variable-pitch . t)))

;;(leaf solo-jazz-theme
;;  :ensure t)

;; (use-package spaceway-theme
;;   :straight nil
;;   :load-path "config/ui/spaceway/"
;;   :config
;;   (global-hl-line-mode t)
;;   (set-cursor-color "#dc322f")
;;   (load-theme 'spaceway t))

(use-package hbb-themes
  :straight nil
  :load-path "config/ui/hbb-themes/"
  ;; :config
  ;; (load-theme 'hbb-plain t)
  )

;; (use-package panda-theme
;;   :config
;;   (load-theme 'panda t))

;; (defun hbb/auto-update-theme ()
;;   "depending on time use different theme"
;;   (let* ((hour (nth 2 (decode-time (current-time))))
;; 	 (theme (cond ((<= 7 hour 8)   'doom-gruvbox-light)
;; 		      ((= 9 hour)      'doom-solarized-light)
;; 		      ((<= 10 hour 16) 'doom-nord-light)
;; 		      ((<= 17 hour 18) 'doom-gruvbox-light)
;; 		      ((<= 19 hour 22) 'doom-oceanic-next)
;; 		      (t               'doom-laserwave))))
;;     (when (not (equal current-theme theme))
;;       (setq current-theme theme)
;;       (load-theme current-theme t))
;;     (run-at-time (format "%02d:%02d" (+ hour 1) 0) nil 'hbb/auto-update-theme)))

;; (hbb/auto-update-theme)

(provide 'theme)
;;; theme.el ends here
