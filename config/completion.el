;;; completion.el --- completion                     -*- lexical-binding: t; -*-

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

;; (leaf completion
;;   :config
;;   (leaf company
;;     :ensure t
;;     :require t
;;     :defun (global-company-mode
;; 	    company-abort
;; 	    company-complete-number)
;;     :custom
;;     ((company-idle-delay . 0.3)
;;      (company-minimum-prefix-length . 1)
;;      (company-begin-commands . '(self-insert-command))
;;      (company-selection-wrap-around . t)
;;      (company-show-numbers . t))
;;     :config
;;     (global-company-mode))

;;   (leaf company-box
;;     :ensure t
;;     :require t
;;     :hook (company-mode-hook . company-box-mode)
;;     :after all-the-icons
;;     :custom
;;     `((company-box-icons-elisp . ',(list (concat (all-the-icons-material "functions") " ")
;; 					 (concat (all-the-icons-material "check_circle") " ")
;; 					 (concat (all-the-icons-material "stars") " ")
;; 					 (concat (all-the-icons-material "format_paint") " ")))
;;       (company-box-icons-unknown . ,(concat (all-the-icons-material "find_in_page") " "))
;;       (company-box-backends-colors . nil)
;;       (company-box-icons-alist . 'company-box-icons-all-the-icons)))

;;   (leaf company-posframe
;;     :ensure t
;;     :require t
;;     :after company
;;     :config
;;     (company-posframe-mode 1))

;;   (leaf company-flx
;;     :ensure t
;;     :hook company-mode-hook)
;;   )

(leaf completion
  :config
  (leaf corfu
    ;; :straight (corfu :type git :host github :repo "minad/corfu")
    :ensure t
    :require t
    :custom
    (corfu-cycle . t) ;; Enable cycling for `corfu-next/previous'
    (corfu-auto . t)  ;; Enable auto completion
    (corfu-auto-delay . 0.01) ;; Enable auto completion
    (corfu-count . 15)	      ;; show more candidates
    (corfu-auto-prefix . 3)
    (corfu-max-width . 150) ;; max width of corfu completion UI
    (corfu-commit-predicate . #'my:corfu-commit-predicate) ;; Do not commit selected candidates on next input
    (corfu-quit-no-match . 'separator)
    (corfu-separator . ?\s)
    (corfu-preview-current . t)	;; Disable current candidate preview
    ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
    (corfu-echo-documentation . nil) ;; Disable documentation in the echo area
    ;; (corfu-scroll-margin 5)        ;; Use scroll margin
    :bind
    (:corfu-map
     ("SPC" . corfu-insert-separator))
    :preface
    ;; from https://github.com/minad/corfu/wiki
    (defun my:corfu-commit-predicate ()
      "Auto-commit candidates if
       1. A \".\" is typed, except after a SPACE.
       2. A key is typed after corfu-complete
       3. A selection was made, aside from entering SPACE.
      "
      (cond
       ((seq-contains-p (this-command-keys-vector) ?.)
	(or (string-empty-p (car corfu--input))
            (not (string= (substring (car corfu--input) -1) " "))))
       
       ((equal last-command #'corfu-complete)
	(or (string-empty-p (car corfu--input))
            (not (string= (substring (car corfu--input) -1) " "))))
       
       ((/= corfu--index corfu--preselect) ; a selection was made
	(not (seq-contains-p (this-command-keys-vector) ? )))))
    :config
    (global-corfu-mode))
  (leaf kind-icon
    :ensure t
    :require t
    :after corfu
    :custom
    (kind-icon-default-face . 'corfu-default) ; to compute blended backgrounds correctly
    :config
    (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)))

(provide 'completion)
;;; completion.el ends here
