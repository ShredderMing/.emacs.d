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

(leaf completion
  :config
  (leaf vertico
    :ensure t
    :custom
    ((vertico-count . 12)
     (vertico-cycle . nil))
    :global-minor-mode t)
  
  (leaf marginalia
    :ensure t
    :custom
    ((marginalia-max-relative-age . 0)
     (marginalia-align . 'right))
    :global-minor-mode t)
  
  (leaf orderless
    :ensure t
    :custom
    ((completion-styles . '(orderless basic))
     (completion-category-overrides . '((file (styles basic partial-completion))))))

  (leaf all-the-icons-completion
    :ensure t
    :after (marginalia all-the-icons)
    :global-minor-mode t)
  
  (leaf corfu
    :ensure t
    :custom
    ((corfu-auto . t)
     (corfu-cycle . t)
     (corfu-preselect-first . nil))
    :bind
    ((:corfu-map
      ("TAB" . corfu-next)
      ([tab] . corfu-next)
      ("S-TAB" . corfu-previous)
      ([backtab] . corfu-previous)))
    :config
    (require 'kind-all-the-icons)
    (add-to-list 'corfu-margin-formatters #'kind-all-the-icons-margin-formatter)
    :global-minor-mode global-corfu-mode)

  (leaf corfu-doc
    :ensure t
    :after corfu
    :hook corfu-mode-hook
    :custom
    ((corfu-doc-delay . 0.8)
     (corfu-doc-max-width . 70)
     (corfu-doc-max-height . 20)))
  
  ;; (leaf kind-icon
  ;;   :el-get jdtsmith/kind-icon
  ;;   :after corfu
  ;;   :custom
  ;;   (kind-icon-default-face . 'corfu-default)
  ;;   :config
  ;;   (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
  )

(provide 'completion)
;;; completion.el ends here
