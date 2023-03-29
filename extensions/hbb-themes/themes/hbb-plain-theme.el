;;; hbb-plain-theme.el --- plain theme               -*- lexical-binding: t; -*-

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

(deftheme hbb-plain
  "A black and white syntax theme")

(let* ((class '((class color) (min-colors 89)))
       (bg "#ffffff")
       (fg "#303030")
       (cursor "#515151")
       (color0 "#f7f7f7")
       (color1 "#7c7c7c")
       (color2 "#8e8e8e")
       (color3 "#a0a0a0")
       (color4 "#686868")
       (color5 "#747474")
       (color6 "#868686")
       (color7 "#464646")
       (color8 "#ababab")
       (color9 "#7c7c7c")
       (color10 "#8e8e8e")
       (color11 "#a0a0a0")
       (color12 "#686868")
       (color13 "#747474")
       (color14 "#868686")
       (color15 "#101010")
       ;; =====
       (error color15)
       (warning "#ff0000")
       (highlight "#efefef")
       (selection color11)
       (success fg)
       (builtin "#010101")
       (comments "#77767b")
       (constants "#010101")
       (doc-comments "#77767b")
       (functions "#010101")
       (keywords "#010101")
       (strings "#77767b")
       (type "#010101")
       (variables "#010101")
       (fringe bg))

  (custom-theme-set-faces
   'hbb-plain
   ;; Default
   `(default ((t (:background ,bg :foreground ,fg))))
   `(italic ((t (:italic t))))
   `(cursor ((t (:background ,cursor))))
   `(hl-line ((t (:background ,highlight))))
   `(highlight ((t (:background ,highlight))))
   `(error ((t (:foreground ,error))))
   `(warning ((t (:foreground ,warning))))
   `(success ((t (:foreground ,success))))
   `(region ((t (:background ,highlight))))
   `(fringe ((t (:background ,fringe))))
   `(link ((t (:foreground ,constants :underline t))))
   `(vertical-border ((t (:foreground ,highlight))))
   ;; Syntax highlighting
   `(font-lock-builtin-face ((t (:foreground ,builtin))))
   `(font-lock-comment-face ((t (:foreground ,comments))))
   `(font-lock-constant-face ((t (:foreground ,constants))))
   `(font-lock-doc-face ((t (:inherit font-lock-comment-face :foreground ,doc-comments))))
   `(font-lock-function-name-face ((t (:bold ,class :foreground ,functions))))
   `(font-lock-keyword-face ((t (:bold ,class :foreground ,keywords :italic t))))
   `(font-lock-string-face ((t (:foreground ,strings))))
   `(font-lock-type-face ((t (:foreground ,type))))
   `(font-lock-variable-name-face ((t (:foreground ,variables))))
   `(font-lock-warning-face ((t (:foreground ,warning))))
   ;; mode-line / header-line
   `(mode-line           ((t (:background ,bg :foreground ,fg :distant-foreground ,bg))))
   `(mode-line-active    ((t (:inherit mode-line))))
   `(mode-line-inactive  ((t (:inherit mode-line))))
   `(mode-line-emphasis  ((t (:foreground ,highlight :distant-foreground ,bg))))
   `(mode-line-highlight ((t (:inherit highlight :distant-foreground ,bg))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(header-line ((t (:inherit mode-line))))
   `(header-line-highlight ((t (:inherit mode-line-highlight))))
   ;; outline
   `(outline-1 ((t (:foreground ,color15 :weight bold :extend t))))
   `(outline-2 ((t (:foreground ,color14 :weight bold :extend t))))
   `(outline-3 ((t (:foreground ,color13 :weight bold :extend t))))
   `(outline-4 ((t (:foreground ,color12 :weight bold :extend t))))
   `(outline-5 ((t (:foreground ,color11 :weight bold :extend t))))
   `(outline-6 ((t (:foreground ,color10 :weight bold :extend t))))
   `(outline-7 ((t (:foreground ,color9 :weight bold :extend t))))
   `(outline-8 ((t (:foreground ,color8 :weight bold :extend t))))
   ;; show-paren
   `(show-paren-match ((t (:background ,color0 :weight ultra-bold))))
   `(show-paren-mismatch ((t (:background ,color15 :weight ultra-bold))))
   ;; centaur-tabs
   `(centaur-tabs-default ((t (:foreground ,fg :background ,bg))))
   `(centaur-tabs-selected ((t (:foreground ,fg :background ,bg))))
   `(centaur-tabs-unselected ((t (:foreground ,fg :background ,color0))))
   `(centaur-tabs-selected-modified ((t (:foreground ,fg :background ,bg))))
   `(centaur-tabs-unselected-modified ((t (:foreground ,fg :background ,color0))))
   `(centaur-tabs-active-bar-face ((t :background ,fg)))
   `(centaur-tabs-modified-marker-selected ((t :foreground ,bg :inherit centaur-tabs-selected)))
   `(centaur-tabs-modified-marker-unselected ((t :foreground ,bg :inherit centaur-tabs-unselected)))
   ;; org
   `(org-document-title ((t (:foreground ,color15 :weight bold))))))

(provide-theme 'hbb-plain)
(provide 'hbb-plain-theme)
;;; hbb-plain-theme.el ends here
