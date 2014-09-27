
(print (procedure? pair?)) ;;@ #t
(print (procedure? (lambda (x) (* x x)))) ;;@ #t
(print (procedure? '())) ;;@ #f
(print (procedure? #t)) ;;@ #f
(print (procedure? 42)) ;;@ #f
(print (procedure? (cons 1 2))) ;;@ #f
(print (procedure? "Definitely not a procedure")) ;;@ #f
(print (procedure? 'either)) ;;@ #f
