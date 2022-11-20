;;; hbb-prog.el ---                                  -*- lexical-binding: t; -*-

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

(use-package tree-sitter
  :straight t
  :hook (python-mode . tree-sitter-mode)
  :hook (c-mode . tree-sitter-mode)
  :hook (c++-mode . tree-sitter-mode)
  :hook (rust-mode . tree-sitter-mode)
  :hook (json-mode . tree-sitter-mode)
  :hook (xml-mode . tree-sitter-mode))

(use-package tree-sitter-hl
  :hook (tree-sitter-mode . tree-sitter-hl-mode))

(use-package tree-sitter-langs
  :straight t
  :after tree-sitter)

(use-package apheleia
  :straight t
  :config
  (dolist (mode '(emacs-lisp-mode lisp-data-mode scheme-mode))
    (push (cons mode 'lisp-indent) apheleia-mode-alist))
  (apheleia-global-mode +1))

(provide 'hbb-prog)
;;; hbb-prog.el ends here
