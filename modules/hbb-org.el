;;; hbb-org.el ---                                   -*- lexical-binding: t; -*-

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

(use-package org
  :straight t
  :bind
  (("C-c o a" . org-agenda)
   ("C-c o c" . org-capture)
   ("C-c o s" . org-schedule)
   ("C-c o d" . org-deadline))
  :custom
  (org-directory "~/Box")
  (org-default-notes-file "~/Box/roam/inbox.org")
  (org-startup-indented t)
  (org-startup-with-inline-images t)
  (org-startup-folded 'content)
  (org-src-fontify-natively t)
  (org-src-window-setup 'current-window)
  (org-src-tab-acts-natively t)
  (org-ellipsis " ...")
  (org-return-follows-link t)
  (org-confirm-babel-evaluate nil)
  (org-agenda-files '("~/Box/roam/projects.org"))
  (org-log-into-drawer t)
  (org-deadline-warning-days 7)
  (org-agenda-skip-scheduled-if-deadline-is-shown t)
  (org-habit-show-habits-only-for-today nil)
  (org-habit-graph-column 65)
  (org-duration-format 'h:mm)
  (org-agenda-compact-blocks t)
  (org-agenda-span 'day)
  (org-agenda-start-day "-0d")
  (org-agenda-start-on-weekday nil)
  (org-agenda-custom-commands
   '(("d" "Done tasks" tags "/DONE|KILL")
     ("g" "Plan Today"
      ((agenda "" ((org-agenda-span 'day)))
       (org-agenda-skip-function '(org-agenda-skip-deadline-if-not-today))
       (org-agenda-entry-types '(:deadline))
       (org-agenda-overriding-header "Today's Deadlines")))))
  (org-agenda-window-setup 'only-window)
  (org-todo-keywords '((sequence "TODO(t)" "STRT(s/!)" "|" "DONE(d/!)")
                       (sequence "WAIT(w@/!)" "|" "KILL(k@/!)")))
  (org-capture-templates '(("t" "Task" entry
                            (file+headline "" "Tasks")
                            "* TODO %^{Task Name}\n%u\n" :clock-in t :clock-resume t)
                           ("i" "Idea" entry
                            (file+headline "" "Ideas")
                            "* %U - %^{Idea} %?\n")
                           ("w" "Wana" entry
                            (file+headline "" "I Wana")
                            "* %U - %^{I Wana} %?\n")))
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C .t) (js . t) (dot . t) (awk . t) (sed . t) (python . t)
     (sql . t) (org . t) (shell . t) (scheme . t)
     (gnuplot . t) (plantuml . t) (makefile . t))))

(use-package org-modern
  :straight t
  :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star '("◉" "○" "◈" "◇" "✳" "◆" "✸" "▶"))
  (org-modern-table-vertical 5)
  (org-modern-table-horizontal 2)
  (org-modern-list '((43 . "➤") (45 . "–") (42 . "•")))
  (org-modern-block-fringe nil))

(use-package valign
  :straight t
  :hook (org-mode . valign-mode)
  :custom (valign-fancy-bar t))

(use-package org-super-agenda
  :straight t
  :after org-agenda
  :custom (org-super-agenda-groups
	         '((:name "Overdue" :deadline past :order 0)
	           (:name "Due Today" :deadline today :order 1)
	           (:name "Important"
		                :and (:priority "A" :not (:todo ("DONE" "KILL")))
		                :order 2)
	           (:name "Today" :time-grid t :order 3)
	           (:name "Due Soon" :deadline future :order 4)
	           (:name "Todo" :not (:habit t) :order 5)
	           (:name "Habits" :habit t :order 6)
	           (:name "Low Priority" :priority "C" :tag "maybe" :order 7)
	           (:name "Waiting" :todo ("WAIT") :order 8)))
  (org-super-agenda-header-map nil)
  :config
  (org-super-agenda-mode t))

(use-package org-roam
  :straight t
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

(provide 'hbb-org)
;;; hbb-org.el ends here
