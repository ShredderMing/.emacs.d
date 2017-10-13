(require 'scheme-keywords)

(defconst scheme-procedures-list '("define-record"))
(defconst scheme-operators-list '())
(defconst scheme-predicates-list '())
(defconst scheme-mutations-list '())
(defconst scheme-exceptions-list '())
(defconst scheme-functions-list '("bytevector->u8-list" "get-u8" "get-char"))

(scheme-add-keywords scheme-procedures-list 'font-lock-keyword-face)
(scheme-add-keywords scheme-operators-list 'font-lock-builtin-face)
(scheme-add-keywords scheme-predicates-list 'font-lock-type-face)
(scheme-add-keywords scheme-mutations-list 'font-lock-type-face)
(scheme-add-keywords scheme-exceptions-list 'font-lock-warning-face)
(scheme-add-keywords scheme-functions-list 'font-lock-function-name-face)

;;fix some indent
(put 'call-with-port 'scheme-indent-function 1)
