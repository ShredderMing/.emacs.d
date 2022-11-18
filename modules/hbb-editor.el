;;; hbb-editor.el ---                                -*- lexical-binding: t; -*-

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

;; File
(global-set-key (kbd "C-c f f") #'find-file)
;; Window
(use-package ace-window
  :straight t
  :bind (("C-c w w" . #'ace-window)
         ("C-c w d" . #'delete-window)
         ("C-c w s" . #'split-window-horizontally)
         ("C-c w v" . #'split-window-vertically))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (aw-background nil))

;; Buffer
(global-set-key (kbd "C-c b k") #'(lambda () (interactive) (kill-buffer (current-buffer))))

(provide 'hbb-editor)
;;; hbb-editor.el ends here
