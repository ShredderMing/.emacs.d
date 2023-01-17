;;; hbb-lisp.el ---                                  -*- lexical-binding: t; -*-

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

(use-package parinfer-rust-mode
  :straight t
  :hook ((emacs-lisp-mode
          clojure-mode
          scheme-mode
          lisp-mode
          racket-mode) . parinfer-rust-mode)
  :custom
  (parinfer-rust-library-directory (concat *hbb-local-dir* "parinfer-rust/"))
  (parinfer-rust-auto-download t))

;; Scheme
(use-package geiser
  :straight t
  :hook ((scheme-mode-hook) . geiser-mode)
  :custom
  (geiser-active-implementations '(chez racket))
  (geiser-default-implementation 'chez))

(use-package geiser-chez
  :straight t)

(use-package racket-mode
  :straight t)

(provide 'hbb-lisp)
;;; hbb-lisp.el ends here
