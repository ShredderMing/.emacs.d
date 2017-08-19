
(defconst color-theme-moe-colors
  '((day . ((background . "#ffffff")
            (current-line . "#efefef")
            (selection . "#d6d6d6")
            (foreground . "#000000")
            (comment . "#8e908c")
            (grey . "#777777")
            (red . "#ff80c3")
            (orange . "#ffcb00")
            (yellow . "#eab700")
            (green . "#718c00")
            (aqua . "#3e999f")
            (blue . "#00acff")
            (purple . "#8959a8")))))

(defmacro moe/with-colors (mode &rest body)
  `(let* ((colors (or (cdr (assoc ,mode color-theme-moe-colors))
                      (error "no such theme flavor")))
          (background (cdr (assoc 'background colors)))
          (current-line (cdr (assoc 'current-line colors)))
          (selection    (cdr (assoc 'selection colors)))
          (foreground   (cdr (assoc 'foreground colors)))
          (comment      (cdr (assoc 'comment colors)))
          (grey         (cdr (assoc 'grey colors)))
          (red          (cdr (assoc 'red colors)))
          (orange       (cdr (assoc 'orange colors)))
          (yellow       (cdr (assoc 'yellow colors)))
          (green        (cdr (assoc 'green colors)))
          (aqua         (cdr (assoc 'aqua colors)))
          (blue         (cdr (assoc 'blue colors)))
          (purple       (cdr (assoc 'purple colors)))
          (class '((class color) (min-colors 89))))
     ,@body))

(defmacro moe/face-specs ()
  (quote
   (mapcar
    (lambda (entry)
      (list (car entry) `((,class ,@ (cdr entry)))))
    `((default (:foreground ,foreground :background ,background))
      (bold (:weight bold))
      (bold-italic (:slant italic :weight bold))
      (underline (:underline t))
      (italic (:slant italic))
      (shadow (:foreground ,comment))
      (success (:foreground ,green))
      (error (:foreground ,red))
      (warning (:foreground ,orange))
      (outline-4 (:slant normal :foreground ,comment))

      ;; Font-lock stuff
      (font-lock-builtin-face (:foreground ,aqua))
      (font-lock-comment-delimiter-face (:foreground ,comment :slant italic))
      (font-lock-comment-face (:foreground ,comment :slant italic))
      (font-lock-constant-face (:foreground ,aqua))
      (font-lock-doc-face (:foreground ,comment))
      (font-lock-doc-string-face (:foreground ,yellow))
      (font-lock-function-name-face (:foreground ,red :weight bold))
      (font-lock-keyword-face (:foreground ,blue :weight bold))
      (font-lock-negation-char-face (:foreground ,green))
      (font-lock-preprocessor-face (:foreground ,purple))
      (font-lock-regexp-grouping-backslash (:foreground ,yellow))
      (font-lock-regexp-grouping-construct (:foreground ,purple))
      (font-lock-string-face (:foreground ,grey :weight bold))
      (font-lock-type-face (:foreground ,yellow :weight bold))
      (font-lock-variable-name-face (:foreground ,orange))
      (font-lock-warning-face (:weight bold :foreground ,red))

      ;; Emacs interface
      (hl-line (:background ,current-line))
      
      ;; js2-mode
      (js2-warning (:underline ,orange))
      (js2-error (:foreground nil :underline ,red))
      (js2-external-variable (:foreground ,purple))
      (js2-function-param (:foreground ,blue))
      (js2-instance-member (:foreground ,blue))
      (js2-private-function-call (:foreground ,red))
      (js2-object-property (:foreground ,yellow))
      (js2-function-call (:foreground ,green))
      (js2-private-member (:foreground ,purple))

      ;; nxml
      (nxml-name-face (:foreground unspecified :inherit font-lock-constant-face))
      (nxml-attribute-local-name-face (:foreground unspecified :inherit font-lock-variable-name-face))
      (nxml-ref-face (:foreground unspecified :inherit font-lock-preprocessor-face))
      (nxml-delimiter-face (:foreground unspecified :inherit font-lock-keyword-face))
      (nxml-delimited-data-face (:foreground unspecified :inherit font-lock-string-face))
      (rng-error-face (:underline ,red))

      ))))
(defmacro moe/frame-parameter-specs ()
  (quote
   `(((background-color . ,background)
      (background-mode . light)
      (border-color . ,foreground)
      (cursor-color . ,purple)
      (foreground-color . ,foreground)
      (mouse-color . ,aqua)))))

(defun moe/theme-name (mode)
  (intern (format "moe-%s" (symbol-name mode))))

(defmacro moe/define-theme (mode)
  (let ((name (moe/theme-name mode))
        (doc (format "moe-%s" mode)))
    `(progn
       (deftheme ,name ,doc)
       (moe/with-colors
        ',mode
        (apply 'custom-theme-set-faces ',name
               (moe/face-specs))
        (custom-theme-set-variables
         ',name
         `(fci-rule-color ,current-line)
         `(ansi-color-names-vector (vector ,foreground ,red ,green ,yellow ,blue ,purple ,aqua ,background))
         '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])))
       (provide-theme ',name))))

(defun color-theme-moe-real (mode)
  (if (fboundp 'load-theme)
      (let ((name (moe/theme-name mode)))
        (if (> emacs-major-version 23)
            (load-theme name t)
          (load-theme name)))
    (progn
      (require 'color-theme)
      (moe/with-colors
       mode
       (color-theme-install
        `(,(intern (concat "color-theme-moe-" (symbol-name mode)))
          ,@(moe/frame-parameter-specs)
          ,@(moe/face-specs)))
       (setq ansi-color-names-vector (vector foreground red green yellow blue purple aqua background))
       (setq ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])))))

(when (boundp 'custom-theme-load-path)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(defun color-theme-moe ()
  (interactive)
  (color-theme-moe-real 'day))

(provide 'color-theme-moe)
