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

;; (require 'theme)
(require 'modeline)
(require 'font)

(use-package all-the-icons
  :config
  (add-to-list 'all-the-icons-extension-icon-alist
	       '("ss" all-the-icons-fileicon "scheme" :height 1.2 :face all-the-icons-red))
  :custom
  (all-the-icons-scale-factor 0.8))

(use-package all-the-icons-dired)

(use-package focus)

(use-package color-identifiers-mode
  :hook (after-init . global-color-identifiers-mode))

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
  :custom-face
  (git-gutter:modified ((t (:background "#f1fa8c"))))
  (git-gutter:added ((t (:background "#50fa7b"))))
  (git-gutter:deleted ((t (:background "#ff79c6"))))
  :config
  (global-git-gutter-mode 1))

(use-package beacon
  :hook (after-init . beacon-mode)
  :custom
  (beacon-color "#eeeeee")
  (beacon-blink-duration 0.7)
  (beacon-size 100))

(use-package fill-column-indicator
  :commands fci-mode)

(use-package paren
  ;; :custom
  ;; ((show-paren-style . 'expression))
  :config (show-paren-mode))

(use-package paren-face
  :custom-face (parenthesis ((t (:foreground "#dadcda"))))
  :config
  (global-paren-face-mode))

;(use-package rainbow-delimiters
;  :hook (prog-mode-hook))

(use-package presentation
  :commands presentation-mode)

(use-package rainbow-mode)

(use-package centered-window
  :custom
  (cwm-centered-window-width 180)
  :config
  (centered-window-mode))

(provide 'hbb-ui)
;;; hbb-ui.el ends here
