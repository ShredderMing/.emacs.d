;;; modeline.el --- modeline                         -*- lexical-binding: t; -*-

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

;; (leaf doom-modeline
;;   :ensure t
;;   :hook (after-init-hook)
;;   :custom ((doom-modeline-buffer-file-name-style quote truncate-with-project)
;;            (doom-modeline-icon . t)
;;            (doom-modeline-major-mode-icon . t)
;;            (doom-modeline-major-mode-color-icon . t)
;;            (line-number-mode . 1)
;;            (column-number-mode . 1)))

(leaf lambda-line
  :el-get lambda-emacs/lambda-line
  :custom
  ((lambda-line-abbrev . t)	    ;; abbreviate major modes
   (lambda-line-hspace . "  ")	    ;; add some cushion
   (lambda-line-prefix . t)	    ;; use a prefix symbol
   (lambda-line-prefix-padding . nil) ;; no extra space for prefix
   (lambda-line-status-invert . nil)  ;; no invert colors
   (lambda-line-gui-ro-symbol . " ⨂") ;; symbols
   (lambda-line-gui-mod-symbol . " ⬤")
   (lambda-line-gui-rw-symbol . " ◯")
   (lambda-line-space-top . 0.5) ;; padding on top and bottom of line
   (lambda-line-space-bottom . -0.5)
   (lambda-line-symbol-position . 0.1))
  :config
  (lambda-line-mode))

(provide 'modeline)
;;; modeline.el ends here
