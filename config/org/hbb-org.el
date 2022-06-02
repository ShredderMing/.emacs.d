;;; hbb-org.el --- org                               -*- lexical-binding: t; -*-

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

(require 'hbb-org-roam)

(leaf org
  :init
  (defun hbb/gtd ()
    "Start my GTD system."
    (interactive)
    (find-file org-default-notes-file))
  :bind
  (("C-c o g" . 'hbb/gtd)
   ("C-c o a" . 'org-agenda)
   ("C-c o c" . 'org-capture))
  :custom
  ((org-default-notes-file . "~/Box/roam/inbox.org")
   (org-agenda-files . '("~/Box/"))
   (org-startup-indented . t)
   (org-src-preserve-indentation . nil)
   (org-ellipsis . " ⋯")
   (org-startup-folded . 'content)
   (org-return-follows-link . t)
   (org-todo-keywords . '((sequence "TODO(t)" "STRT(s/!)" "|" "DONE(d/!)")
			  (sequence "WAIT(w@/!)" "|" "KILL(k@/!)")))
   (org-capture-templates . '(("t" "Task" entry
			       (file+headline "" "Tasks")
			       "* TODO %^{任务名称}\n%u\n" :clock-in t :clock-resume t)
			      ("i" "Idea" entry
			       (file+headline "" "Ideas")
			       "* %U - %^{Idea} %?\n")
			      ("w" "Wana" entry
			       (file+headline "" "I Wana")
			       "* %U - %^{I Wana} %?\n")))))

(leaf org-superstar
  :ensure t
  :hook org-mode-hook
  :custom
  ((org-superstar-special-todo-items . t)
   (org-superstar-headline-bullets-list . '("⬢" "◆" "▲" "■"))))

(leaf org-fancy-priorities
  :ensure t
  :hook ((org-mode-hook org-agenda-mode-hook) . org-fancy-priorities-mode)
  :custom
  ((org-fancy-priorities-list . '("⚑" "⬆" "■"))))

(provide 'hbb-org)
;;; hbb-org.el ends here
