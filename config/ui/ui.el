;;; ui.el --- ui                                     -*- lexical-binding: t; -*-

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

(leaf all-the-icons
  :ensure t
  :defer-config
  (add-to-list 'all-the-icons-extension-icon-alist
	       '("ss" all-the-icons-fileicon "scheme" :height 1.2 :face all-the-icons-red))
  :custom
  (all-the-icons-scale-factor . 0.8))

(leaf all-the-icons-dired :ensure t)

(leaf focus
  :ensure t)

(leaf color-identifiers-mode
  :ensure t
  :blackout t
  :commands global-color-identifiers-mode
  :hook ((after-init-hook . global-color-identifiers-mode)))

(leaf highlight-indent-guides
  :ensure t
  :blackout t
  :hook (yaml-mode-hook)
  :custom ((highlight-indent-guides-auto-enabled . t)
           (highlight-indent-guides-responsive . t)
           (highlight-indent-guides-method . 'character)))

(leaf git-gutter
  :ensure t
  :custom ((git-gutter:modified-sign . "~")
           (git-gutter:added-sign . "+")
           (git-gutter:deleted-sign . "-"))
  :custom-face ((git-gutter:modified . '((t (:background "#f1fa8c"))))
                (git-gutter:added . '((t (:background "#50fa7b"))))
                (git-gutter:deleted . '((t (:background "#ff79c6")))))
  :config
  (global-git-gutter-mode 1))

(leaf beacon
  :ensure t
  :blackout t
  :hook (prog-mode-hook)
  ;; :custom ((beacon-color . "#bd93f9")
  ;; 	   (beacon-blink-duration . 0.7)
  ;; 	   (beacon-size . 100))
  )

(leaf fill-column-indicator
  :commands fci-mode)

(leaf paren
  :custom
  ((show-paren-style . 'expression))
  :global-minor-mode show-paren-mode)

(leaf paren-face
  :ensure t
  :custom-face ((parenthesis . '((t (:foreground "DimGray")))))
  :global-minor-mode global-paren-face-mode)

;; (leaf rainbow-delimiters
;;   :ensure t
;;   :blackout t
;;   :hook (prog-mode-hook))

(leaf presentation
  :ensure t
  :commands presentation-mode)

(leaf rainbow-mode
  :ensure t)

(leaf centered-window
  :ensure t
  :custom
  ((cwm-centered-window-width . 180))
  :global-minor-mode t)

(provide 'ui)
;;; ui.el ends here
