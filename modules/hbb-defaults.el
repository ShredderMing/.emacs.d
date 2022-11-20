;;; hbb-defaults.el ---                              -*- lexical-binding: t; -*-

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

(set-language-environment "UTF-8")
(set-charset-priority 'unicode)
(set-default-coding-systems 'utf-8)

(setq
 ;; ====== Default behavior ======
 ;; Do not ring
 ring-bell-function 'ignore
 ;; Increase the large file threshold to 50 MiB
 large-file-warning-threshold (* 50 1024 1024)
 ;; Initial scratch message (will be overriten if "fortune" is installed)
 initial-scratch-message (concat ";; Happy hacking, " user-login-name
				 " - Emacs ♥ you!\n\n")
 ;; Set initial buffer to fundamental-mode for faster load
 initial-major-mode 'fundamental-mode
 ;; Always prompt in minibuffer (no GUI)
 use-dialog-box nil
 ;; Use y or n istead of yes or no
 use-short-answers t
 ;; Confirm before quitting
 ;confirm-kill-emacs 'y-or-n-p
 ;; Filter duplicate entries in kill ring
 kill-do-not-save-duplicates t
 ;; Save existing clipboard text into the kill ring before replacing it.
 save-interprogram-paste-before-kill t
 ;; Save files only in subdirs of current project
 save-some-buffers-default-predicate 'save-some-buffers-root
 ;; Use single space between sentences
 sentence-end-double-space nil
 ;; Move stuff to trash
 delete-by-moving-to-trash t
 ;; Select help window to fastly quit!
 help-window-select t
 ;; More info on completions
 completions-detailed t
 ;; Needs xref-1.1.0, for Emacs < 28.1, xref needs to be updated
 ;; Use completing-read interface instead of definitions buffer
 xref-show-definitions-function #'xref-show-definitions-completing-read

 ;; ====== Default directories ======
 ;; Default directory to save backups
 backup-directory-alist (list (cons "." (concat *hbb-local-dir* "backup/")))
 ;; Locally save backups for files edited via Trump
 tramp-backup-directory-alist backup-directory-alist
 ;; Prefix for auto saved files
 auto-save-list-file-prefix (concat *hbb-local-dir* "auto-save-list/")

 ;; ====== Aesthetics ======
 ;; Set to non-nil to flash!
 visible-bell nil
 ;; Better unicode glyph for string truncate
 truncate-string-ellipsis "…"
 ;; Do force frame size to be a multiple of char size
 frame-resize-pixelwise t
 ;; Stretch cursor to the glyph width
 x-stretch-cursor t
 ;; Resize window combinations proportionally
 window-combination-resize t
 ;; Enable time in the mode-line
 display-time-string-forms
 '((propertize (concat 24-hours ":" minutes)))

 ;; ====== Authentication and encryption ======
 ;; Default auth-sources to GPG
 auth-sources '("~/.authinfo.gpg")
 ;; Enable caching, do not keep asking about GPG key
 auth-source-do-cache t
 ;; All day, default is 2h (7200)
 auth-source-cache-expiry 86400
 ;; Enable password caching
 password-cache t
 ;; One minute, default is 16
 password-cache-expiry 60

 ;; ====== Undo ======
 ;; 1MB (default is 160kB)
 undo-limit 10000000
 ;; 100MB (default is 240kB)
 undo-strong-limit 100000000
 ;; 1GB (default is 24MB)
 undo-outer-limit 1000000000

 ;; ====== Editing ======
 ;; Hitting TAB behavior
 tab-always-indent t
 ;; Default behavior for `whitespace-cleanup'
 whitespace-action '(cleanup auto-cleanup)

 ;; ====== Backups ======
 ;; Disable backup and lockfiles
 create-lockfiles nil
 ;; Disable making backup files
 make-backup-files nil
 ;; Number each backup file
 version-control t
 ;; Copy instead of renaming current file
 backup-by-copying t
 ;; Clean up after itself
 delete-old-versions t
 ;; Keep up to 5 old versions of each file
 kept-old-versions 5
 ;; Keep up to 5 new versions of each file
 kept-new-versions 5

 ;; ====== Scrolling ======
 ;; Do not adjust window-vscroll to view tall lines
 auto-window-vscroll nil
 ;; Fast scrolling
 fast-but-imprecise-scrolling t
 ;; Keep the point in the same position while scrolling
 scroll-preserve-screen-position t

 ;; ====== Recent files ======
 ;; Increase the maximum number of saved items
 recentf-max-saved-items 100

 ;; ====== Auto-Saving, sessions ======
 ;; Enable auto-save (use `recover-file' or `recover-session' to recover)
 auto-save-default t
 ;; Include big deletions
 auto-save-include-big-deletions t
 ;; Set file naming transform
 auto-save-file-name-transforms
 (list (list "\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'"
             ;; Prefix tramp autosaves to prevent conflicts with local ones
             (concat auto-save-list-file-prefix "tramp-\\2") t)
       (list ".*" auto-save-list-file-prefix t)))

(setq-default
 ;; ====== Editing ======
 ;; Display long lines
 truncate-lines nil
 ;; Default fill column width
 fill-column 80
 ;; Never mix, use only spaces
 indent-tabs-mode nil
 ;; Width for line numbers
 display-line-numbers-width 4
 ;; Small tab is enough!
 tab-width 2

 ;; ======= Scrolling =======
 ;; Do not scroll to the center when point exceeds the beginning/end of buffer.
 scroll-up-aggressively 0.01
 scroll-down-aggressively 0.01)

;;; Enable global modes
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

;; Remove trailing whitespaces on save, for modes derived
;; from `prog-mode', `org-mode' or `markdown-mode'
(add-hook
 'before-save-hook
 (defun +save--delete-trailing-whitespace-h ()
   (when (or (derived-mode-p 'prog-mode)
             (derived-mode-p 'org-mode)
             (derived-mode-p 'markdown-mode))
     (delete-trailing-whitespace))))

;; Guess major mode when saving a file (adapted from Doom Emacs)
(add-hook
 'after-save-hook
 (defun +save--guess-file-mode-h ()
   "Guess major mode when saving a file in `fundamental-mode'.
Likely, something has changed since the buffer was opened. e.g. A shebang line
or file path may exist now."
   (when (eq major-mode 'fundamental-mode)
     (let ((buffer (or (buffer-base-buffer) (current-buffer))))
       (and (buffer-file-name buffer)
            (eq buffer (window-buffer (selected-window))) ;; Only visible buffers
            (set-auto-mode))))))

;; Kill minibuffer when switching by mouse to another window
;; Taken from: https://trey-jackson.blogspot.com/2010/04/emacs-tip-36-abort-minibuffer-when.html
(add-hook
 'mouse-leave-buffer-hook
 (defun +minibuffer--kill-on-mouse-h ()
   "Kill the minibuffer when switching to window with mouse."
   (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
     (abort-recursive-edit))))

  ;; Scroll pixel by pixel
  (pixel-scroll-mode 1)

  ;; Window layout undo/redo (`winner-undo' / `winner-redo')
  (winner-mode 1)

  ;; Precision scroll
  (when (>= emacs-major-version 29)
    (pixel-scroll-precision-mode 1))

  ;; Display time in mode-line
  (display-time-mode 1)

  ;; Replace selection after start typing
  (delete-selection-mode 1)

  ;; Enable recentf-mode globally
  (recentf-mode 1)

  ;; Save place in files
  (save-place-mode 1)

  ;; Enable saving minibuffer history
  (savehist-mode 1)

  ;; Show line and column numbers (cursor position) in mode-line
  (line-number-mode 1)
  (column-number-mode 1)

  ;; Wrap long lines
  (global-visual-line-mode 1)

  ;; Better handling for files with so long lines
  (global-so-long-mode 1)

  ;; Global SubWord mode
  (global-subword-mode 1)

(provide 'hbb-defaults)
;;; hbb-defaults.el ends here
