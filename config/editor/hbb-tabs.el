;;; hbb-tabs.el --- tabs                                 -*- lexical-binding: t; -*-

;; Copyright (C) 2022  Harry

;; Author: Harry <harry@SummerTear>
;; Keywords:
;; c

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

(leaf centaur-tabs
  :ensure t
  :hook ((dashboard-mode-hook
	  vterm-mode-hook
	  calendat-mode-hook
	  org-agenda-mode-hook
	  helpful-mode-hook) . centaur-tabs-local-mode)
  :bind
  (("s-{" . centaur-tabs-backward)
   ("s-}" . centaur-tabs-forward))
  :custom ((centaur-tabs-height . 32)
	   (centaur-tabs-style . "bar")
	   (centaur-tabs-set-icons . t)
	   (centaur-tabs-set-bar . 'under)
	   (x-underline-at-descent-line . t)
	   (centaur-tabs-set-close-button . nil)
	   (centaur-tabs-set-modified-marker . t)
	   (centaur-tabs-modified-marker . "●"))
  :config
  (centaur-tabs-group-by-projectile-project)
  :global-minor-mode t)

(provide 'hbb-tabs)
;;; hbb-tabs.el ends here
