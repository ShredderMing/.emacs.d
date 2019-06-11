;;; tear-theme.el --- A light theme for emacs based on tear design

;; Copyright (C) 2019 Shredderming

;; Author: Shredderming <shredderming@gmail.com>
;; Keywords: themes
;; URL: http://github.com/shredderming/tear-theme
;; Version: 0.0.1
;; X-Original-Version: 0.1
;; Package-Requires: ((emacs "24.1"))

;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Commentary:

;; To use it, put the following in your Emacs configuration file:
;;
;;   (load-theme 'tear t)
;;
;; Requirements: Emacs 24.

;;; Credits:

;; Thanks to Christoph Paulik of the Material Theme which was used as the boilerplate:
;; https://github.com/cpaulik/emacs-material-theme

;;; Code:

(deftheme tear
  "light theme for emacs based on tear design")
(let ((class '((class color) (min-colors 89)))
      (background "#ffffff")
      (current-line "#efefef")
      (selection "#d6d6d6")
      (foreground "#1f1f1f")
      (comment "#8e908c")
      (grey "#777777")
      (red "#ff80c3")
      (orange "#ffcb00")
      (yellow "#eab700")
      (green "#718c00")
      (aqua "#3e999f")
      (blue "#00acff")
      (purple "#8959a8"))
  (custom-theme-set-faces
   'tear
   `(default ((,class (:foreground ,foreground :background ,background))))
   `(bold ((,class (:weight bold))))
   `(bold-italic ((,class (:slant italic :weight bold))))
   `(underline ((,class (:underline t))))
   `(italic ((,class (:slant italic))))
   `(font-lock-builtin-face ((,class (:foreground ,aqua))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,comment))))
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-constant-face ((,class (:foreground ,green))))
   `(font-lock-doc-face ((,class (:foreground ,comment))))
   `(font-lock-doc-string-face ((,class (:foreground ,yellow))))
   `(font-lock-function-name-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,yellow))))
   `(font-lock-negation-char-face ((,class (:foreground ,blue))))
   `(font-lock-preprocessor-face ((,class (:foreground ,purple))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,yellow))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,purple))))
   `(font-lock-string-face ((,class (:foreground ,grey :weight bold))))
   `(font-lock-type-face ((,class (:foreground ,yellow :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,orange))))
   `(font-lock-warning-face ((,class (:weight bold :foreground ,red))))
   `(shadow ((,class (:foreground ,comment))))
   `(success ((,class (:foreground ,green))))
   `(error ((,class (:foreground ,red))))
   `(warning ((,class (:foreground ,orange))))
   ;; emacs interface
   `(hl-line ((,class (:background ,current-line))))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  ;; add theme folder to `custom-theme-load-path' when installing over MELPA
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'tear)

;; Local Variables:
;; rainbow-mode: t
;; hl-sexp-mode: nil
;; End:

;;; tear-theme.el ends here
