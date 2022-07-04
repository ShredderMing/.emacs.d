;;; hbb-lang.el --- lang                                 -*- lexical-binding: t; -*-

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

(require 'hbb-racket)
(require 'hbb-scheme)
(require 'hbb-markdown)
(require 'hbb-dart)
(require 'hbb-rust)

(use-package lispy
  :hook
  emacs-lisp-mode-hook
  scheme-mode-hook
  racket-mode-hook)

(use-package elec-pair
  :straight nil
  :hook ((org-mode-hook) . (lambda ()
			     (setq-local electric-pair-inhibit-predicate
					 `(lambda (c)
					    (if (char-equal c ?<)
						t
					      (,electric-pair-inhibit-predicate c))))))
  :config (electric-pair-mode))

(use-package prog-mode
  :straight nil
  :config
  (global-prettify-symbols-mode))

(provide 'hbb-lang)
;;; hbb-lang.el ends here
