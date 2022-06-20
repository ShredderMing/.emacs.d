;;; hbb-org-roam.el --- roam                         -*- lexical-binding: t; -*-

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

(leaf org-roam
  :ensure t
  :custom
  ((org-roam-v2-ack . t)
   (org-roam-directory . "~/Box/roam/")
   (org-roam-db-location . "~/Box/roam/org-roam.db"))
  :bind (("C-c n r l" . org-roam-buffer-toggle)
	 ("C-c n r f" . org-roam-node-find)
	 (:org-mode-map
	  (("C-c n r i" . org-roam-node-insert))))
  :config
  (org-roam-db-autosync-mode))

(leaf deft
  :ensure t
  :bind (("C-c n r d" . deft))
  :custom
  ((deft-recursive . t)
   (deft-use-filter-string-for-filename . t)
   (deft-default-extension . "org")
   (deft-directory . org-roam-directory)))

(provide 'hbb-org-roam)
;;; hbb-org-roam.el ends here
