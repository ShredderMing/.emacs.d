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

(use-package org-roam
  :custom
  (org-roam-v2-ack t)
  (org-roam-directory "~/Box/roam/")
  (org-roam-db-location "~/Box/roam/org-roam.db")
  (org-roam-node-display-template
   (concat "${title:*} " (propertize "${tags:30}" 'face 'org-tag)))
  :bind (("C-c n r f" . org-roam-node-find)
	 ("C-c n r r" . org-roam-node-random)
	 (:map org-mode-map
	       ("C-c n r i" . org-roam-node-insert)
	       ("C-c n r o" . org-id-get-create)
	       ("C-c n r t" . org-roam-tag-add)
	       ("C-c n r a" . org-roam-alias-add)
	       ("C-c n r l" . org-roam-buffer-toggle)))
  :config
  (org-roam-db-autosync-mode))

(use-package org-roam-ui
  :straight
  (:host github :repo "org-roam/org-roam-ui" :branch "main" :files ("*.el" "out"))
  :after org-roam
  :custom
  (org-roam-ui-sync-theme t)
  (org-roam-ui-follow t)
  (org-roam-ui-update-on-save t)
  (org-roam-ui-open-on-start t))

(use-package deft
  :after org-roam
  :bind ("C-c n r d" . deft)
  :custom
  (deft-extensions '("org" "gpg" "md" "txt"))
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory org-roam-directory))

(provide 'hbb-org-roam)
;;; hbb-org-roam.el ends here
