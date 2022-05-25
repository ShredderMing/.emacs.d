;;; editor.el --- editor                             -*- lexical-binding: t; -*-

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

(require 'sidebar)
(require 'tabs)

(leaf ivy
  :blackout t
  :ensure t
  :bind (("C-c C-r" . ivy-resume)
         (ivy-minibuffer-map
          ("<backspace>" . backward-delete-char-untabify)
          ("<right>" . ivy-alt-done)
          ("<left>" . ivy-alt-done)
          ("<enter>" . ivy-immediate-done)
          ("C-z" . ivy-dispatching-done)))
  :global-minor-mode t
  :leaf-defer nil
  :custom ((ivy-initial-inputs-alist . nil)
           (enable-recursive-minibuffers . t)
           (ivy-use-virtual-buffers . t)
           (ivy-count-format . "(%d/%d) ")
           (ivy-use-selectable-prompt . t)
           (ivy-format-function . 'ivy-format-function-line))
  :config
  (leaf wgrep
    :ensure t
    :after ivy
    :custom ((wgrep-enable-key . "e")
             (wgrep-auto-save-buffer . t)
             (wgrep-change-readonly-file . t)))
  (leaf swiper
    :ensure t
    :blackout t
    :commands swiper
    :bind (("C-S-s" . swiper-all))
    :custom ((swiper-action-recenter . t)))
  (leaf counsel
    :ensure t
    :blackout t
    :global-minor-mode t
    :bind (("M-x" . counsel-M-x)
           ("C-x C-f" . counsel-find-file)
           ("C-x C-b" . ivy-switch-buffer)
           ("C-c g" . counsel-git)
           ("C-c i" . counsel-imenu)
           ("C-M-." . counsel-imenu)
           ("C-c a" . counsel-ag)
           ("C-c r" . counsel-rg)
           (minibuffer-local-map
            ("C-r" . counsel-minibuffer-history)))
    :custom ((counsel-find-file-at-point . t)))
  (leaf all-the-icons-ivy-rich
    :ensure t
    :global-minor-mode t)
  (leaf ivy-rich
    :ensure t
    :after ivy
    :global-minor-mode t)
  (leaf prescient
    :ensure t
    :commands (prescient-persist-mode)
    :custom `((prescient-aggressive-file-save . t)
              (prescient-save-file . ,(locate-user-emacs-file "prescient")))
    :global-minor-mode prescient-persist-mode)
  (leaf ivy-prescient
    :ensure t
    :after prescient ivy
    :custom ((ivy-prescient-retain-classic-highlighting . t))
    :global-minor-mode t)
  (leaf ivy-xref
    :ensure t))

(provide 'editor)
;;; editor.el ends here
