;;; hbb-sidebar.el --- sidebar                           -*- lexical-binding: t; -*-

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

(leaf treemacs
  :ensure t
  :bind (("C-c o p" . treemacs)
	 (treemacs-mode-map
          ([mouse-1] . treemacs-single-click-expand-action)))
  :config
  (treemacs-resize-icons 17))

(leaf treemacs-icons-dired
  :ensure t
  :after treemacs dired
  :config (treemacs-icons-dired-mode))

(leaf treemacs-magit
  :ensure t
  :after treemacs magit)

(leaf treemacs-projectile
  :ensure t
  :after treemacs projectile)

(provide 'hbb-sidebar)
;;; hbb-sidebar.el ends here
