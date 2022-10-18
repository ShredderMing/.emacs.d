;;; hbb-ui.el --- ui                                     -*- lexical-binding: t; -*-

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

(require 'theme)
(require 'modeline)
(require 'font)

(use-package hl-line
  :straight nil
  :config (global-hl-line-mode))

(use-package all-the-icons
  :config
  (add-to-list 'all-the-icons-extension-icon-alist
	       '("ss" all-the-icons-fileicon "scheme"
		 :height 1.2
		 :face all-the-icons-red))
  :custom
  (all-the-icons-scale-factor 0.8))

(use-package all-the-icons-dired)

(use-package focus)

;; (use-package color-identifiers-mode
;;   :hook (after-init . global-color-identifiers-mode))

(use-package highlight-indent-guides
  :hook (yaml-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-auto-enabled t)
  (highlight-indent-guides-responsive t)
  (highlight-indent-guides-method 'character))

(use-package git-gutter
  :custom
  (git-gutter:modified-sign "~")
  (git-gutter:added-sign "+")
  (git-gutter:deleted-sign "-")
  ;; :custom-face
  ;; (git-gutter:modified ((t (:background "#f1fa8c"))))
  ;; (git-gutter:added ((t (:background "#50fa7b"))))
  ;; (git-gutter:deleted ((t (:background "#ff79c6"))))
  :config
  (global-git-gutter-mode 1))

(use-package beacon
  :hook (after-init . beacon-mode)
  :custom
  (beacon-color (face-attribute 'cursor :background))
  (beacon-blink-duration 0.7)
  (beacon-size 40))

(use-package fill-column-indicator
  :commands fci-mode)

(use-package paren
  ;; :custom
  ;; (show-paren-style 'expression)
  :config (show-paren-mode))

;; (use-package paren-face
;;   :custom-face (parenthesis ((t (:foreground "#dadcda"))))
;;   :config
;;   (global-paren-face-mode))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package presentation
  :commands presentation-mode)

(use-package rainbow-mode
  :config
  (rainbow-mode))

(use-package centered-window
  :custom
  (cwm-centered-window-width 120))

;; (use-package svg-tag-mode
;;   :config
;;   (defconst date-re "[0-9]\\{4\\}-[0-9]\\{2\\}-[0-9]\\{2\\}")
;;   (defconst time-re "[0-9]\\{2\\}:[0-9]\\{2\\}")
;;   (defconst day-re "[一|二|三|四|五|六|日]")
;;   (defconst day-time-re (format "\\(%s\\)? ?\\(%s\\)?" day-re time-re))

;;   (defun svg-progress-percent (value)
;;     (svg-image (svg-lib-concat
;; 		(svg-lib-progress-bar (/ (string-to-number value) 100.0)
;;                                       nil :margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
;; 		(svg-lib-tag (concat value "%")
;;                              nil :stroke 0 :margin 0)) :ascent 'center))
  
;;   (defun svg-progress-count (value)
;;     (let* ((seq (mapcar #'string-to-number (split-string value "/")))
;;            (count (float (car seq)))
;;            (total (float (cadr seq))))
;;       (svg-image (svg-lib-concat
;; 		  (svg-lib-progress-bar (/ count total) nil
;; 					:margin 0 :stroke 2 :radius 3 :padding 2 :width 11)
;; 		  (svg-lib-tag value nil
;;                                :stroke 0 :margin 0)) :ascent 'center)))
  
;;   (setq svg-tag-tags
;; 	`(
;;           ;; Org tags
;;           (":\\([A-Za-z0-9]+\\)" . ((lambda (tag) (svg-tag-make tag))))
;;           (":\\([A-Za-z0-9]+[ \-]\\)" . ((lambda (tag) tag)))
          
;;           ;; Task priority
;;           ("\\[#[A-Z]\\]" . ( (lambda (tag)
;; 				(svg-tag-make tag :face 'org-priority 
;;                                               :beg 2 :end -1 :margin 0))))
	  
;;           ;; Progress
;;           ("\\(\\[[0-9]\\{1,3\\}%\\]\\)" . ((lambda (tag)
;;                                               (svg-progress-percent (substring tag 1 -2)))))
;;           ("\\(\\[[0-9]+/[0-9]+\\]\\)" . ((lambda (tag)
;;                                             (svg-progress-count (substring tag 1 -1)))))
          
;;           ;; TODO / DONE
;;           ("TODO" . ((lambda (tag) (svg-tag-make "TODO" :face 'org-todo :inverse t :margin 0))))
;;           ("DONE" . ((lambda (tag) (svg-tag-make "DONE" :face 'org-done :margin 0))))
	  
	  
;;           ;; Citation of the form [cite:@Knuth:1984] 
;;           ("\\(\\[cite:@[A-Za-z]+:\\)" . ((lambda (tag)
;;                                             (svg-tag-make tag
;;                                                           :inverse t
;;                                                           :beg 7 :end -1
;;                                                           :crop-right t))))
;;           ("\\[cite:@[A-Za-z]+:\\([0-9]+\\]\\)" . ((lambda (tag)
;;                                                      (svg-tag-make tag
;; 								   :end -1
;; 								   :crop-left t))))

          
;;           ;; Active date (with or without day name, with or without time)
;;           (,(format "\\(<%s>\\)" date-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :beg 1 :end -1 :margin 0))))
;;           (,(format "\\(<%s \\)%s>" date-re day-time-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0))))
;;           (,(format "<%s \\(%s>\\)" date-re day-time-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0))))
	  
;;           ;; Inactive date  (with or without day name, with or without time)
;;           (,(format "\\(\\[%s\\]\\)" date-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :beg 1 :end -1 :margin 0 :face 'org-date))))
;;           (,(format "\\(\\[%s \\)%s\\]" date-re day-time-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :beg 1 :inverse nil :crop-right t :margin 0 :face 'org-date))))
;;           (,(format "\\[%s \\(%s\\]\\)" date-re day-time-re) .
;;            ((lambda (tag)
;;               (svg-tag-make tag :end -1 :inverse t :crop-left t :margin 0 :face 'org-date))))))
;;   (global-svg-tag-mode))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
