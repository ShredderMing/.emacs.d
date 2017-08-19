(require-or-install 'prettier-js)
(setq prettier-js-args '("--single-quote"))
(add-hook 'js-mode-hook 'prettier-js-mode)
