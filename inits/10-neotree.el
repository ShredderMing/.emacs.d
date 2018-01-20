(require-or-install 'neotree)
(require-or-install 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(global-set-key [f8] 'neotree-toggle)
