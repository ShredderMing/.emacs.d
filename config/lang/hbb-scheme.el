;;; hbb-scheme.el --- scheme                             -*- lexical-binding: t; -*-

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

(use-package geiser-chez
  :hook ((scheme-mode-hook) . geiser-mode)
  :config
  (put 'define-ftype 'scheme-indent-function 'defun)
  ;; (put 'define-ftype 'scheme-indent-function 0)
  (put 'make-ftype-pointer 'scheme-indent-function 1)
  (put 'begin0 'scheme-indent-function 0)
  (put 'call-with-errno 'scheme-indent-function 0)
  (put 'critical-section 'scheme-indent-function 0)
  :custom
  (geiser-activate-implementation '(chez))
  (geiser-chez-binary "scheme")
  (geiser-default-implementation 'chez))

(provide 'hbb-scheme)
;;; hbb-scheme.el ends here
