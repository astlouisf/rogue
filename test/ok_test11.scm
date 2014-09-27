(define e '())
(print (eq? e '())) ;;@ #t
(print (null? e))   ;;@ #t
(print (string? e)) ;;@ #f
(print (symbol? e)) ;;@ #f
(print (%pair? e))  ;;@ #f
(print e) ;;@ ()