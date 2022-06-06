;;; font.el --- font                                 -*- lexical-binding: t; -*-

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

(defconst *font* "Iosevka")
(defconst *font-weight* 'normal)
(defconst *font-size* 14)
(defconst *font-cjk* "Noto Sans CJK SC")
(defconst *font-weight-cjk* 'normal)
(defconst *font-size-cjk* 14)

(defun hbb/set--font (frame)
  "HBB set font for `FRAME'."
  (when (display-graphic-p)
    (set-face-attribute
     'default nil
     :font (font-spec :name   *font*
                      :weight *font-weight*
                      :size   *font-size*))
    
    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :name   *font-cjk*
                                   ;; :weight *font-weight-cjk*
                                   ;; :size   *font-size-cjk*
				   )
                        frame
                        'prepend))
    
    (set-fontset-font t
                      'symbol
                      (font-spec :family "Noto Color Emoji")
                      frame
                      'prepend)
    
    (set-face-attribute 'mode-line nil
                        :font (font-spec :name   *font*
                                         :weight 'normal
                                         :size   14))
    
    (set-face-attribute 'mode-line-inactive nil
                        :font (font-spec :name   *font*
                                         :weight 'normal
                                         :size   14))))

(defun hbb/set-font (&rest _)
  "HBB set font."
  (interactive)
  (hbb/set--font nil))

(add-hook #'after-init-hook #'hbb/set-font)
(add-hook #'after-make-frame-functions   #'hbb/set-font)
(add-hook #'server-after-make-frame-hook #'hbb/set-font)

(provide 'font)
;;; font.el ends here
