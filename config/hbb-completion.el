;;; hbb-completion.el --- completion                     -*- lexical-binding: t; -*-

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

(use-package vertico
  :custom
  (vertico-count 12)
  (vertico-cycle nil)
  :config
  (vertico-mode))

(use-package consult
  :bind
  (("C-c f r" . consult-recent-file)
   ("C-c t t" . consult-theme)))

(use-package marginalia
  :custom
  (marginalia-max-relative-age 0)
  (marginalia-align 'right)
  :config (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :config
  (all-the-icons-completion-mode))

(use-package corfu
  :custom
  (corfu-auto t)
  (corfu-cycle t)
  (corfu-preselect-first nil)
  :bind
  ((:map corfu-map
	 ("TAB" . corfu-next)
	 ([tab] . corfu-next)
	 ("S-TAB" . corfu-previous)
	 ([backtab] . corfu-previous)))
  :config (global-corfu-mode))

(use-package corfu-doc
  :after corfu
  :hook corfu-mode-hook
  :custom
  (corfu-doc-delay 0.8)
  (corfu-doc-max-width 70)
  (corfu-doc-max-height 20))

(use-package yasnippet
  :config (yas-global-mode))

(use-package lsp-bridge
    :straight (lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge")
    :after corfu
    :hook ((prog-mode-hook) . lsp-bridge-mode))

(provide 'hbb-completion)
;;; hbb-completion.el ends here
