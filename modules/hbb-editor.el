;;; hbb-editor.el ---                                -*- lexical-binding: t; -*-

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

;; Session
(global-set-key (kbd "C-c q") 'hbb-session-map)
(defalias 'hbb-session-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "q") #'save-buffers-kill-terminal)
    (define-key map (kbd "Q") #'kill-emacs)
    (define-key map (kbd "s") #'server-start)
    (define-key map (kbd "R") #'recover-session)
    map)
  "Session-releated bindings.")

;; File
(global-set-key (kbd "C-c f") 'hbb-file-map)
(defalias 'hbb-file-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "f") #'find-file)
    map)
  "File-releated bindings.")

;; Window
(use-package ace-window
  :straight t
  :bind (:prefix-map hbb-window-map
                     :prefix "C-c w"
                     ("w" . #'ace-window)
                     ("d" . #'delete-window)
                     ("s" . #'split-window-horizontally)
                     ("v" . #'split-window-vertically))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (aw-background nil))

;; Buffer
(defun hbb-kill-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(global-set-key (kbd "C-c b") 'hbb-buffer-map)
(defalias 'hbb-buffer-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "k") #'hbb-kill-buffer)
    map)
  "Buffer-related bindings.")

;; Help
(use-package helpful
  :straight t
  :after elisp-mode
  :commands (helpful-symbol helpful-command helpful-callable helpful-at-point)
  :bind
  (("C-h p" . #'helpful-at-point)
   ("C-h o" . #'helpful-symbol)
   ("C-h c" . #'helpful-command)
   ("C-h F" . #'helpful-function)
   ("C-h f" . #'helpful-callable)))

(provide 'hbb-editor)
;;; hbb-editor.el ends here
