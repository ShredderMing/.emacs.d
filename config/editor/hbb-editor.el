;;; editor.el --- editor                             -*- lexical-binding: t; -*-

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

(require 'hbb-sidebar)
(require 'hbb-tabs)

(leaf ace-window
  :ensure t
  :bind (("M-o" . ace-window))
  :custom
  ((aw-keys . '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
   (aw-background . nil)))

(provide 'hbb-editor)
;;; editor.el ends here
