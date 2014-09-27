
(define x (lambda (x y) (+ x y)))
(define y (cons 1 (cons 2 (cons 3 (cons 4 '())))))
(define z (cons (cons 1 2) (cons (cons 3 4) '())))
(print (apply x (cons 1 (cons 2 '())))) ;;@ 3
(print (equal? (cons 1 (cons 2 '()))
               (cons 1 (cons 2 3)))) ;;@ #f
(print (equal? (cons 1 (cons 2 '()))
               (cons 1 (cons 2 '())))) ;;@ #t
(set-car! y -1)
(print y) ;;@ (-1 2 3 4)
(set-car! (cdr (cdr y)) -3)
(print y) ;;@ (-1 2 -3 4)
(print (list? (cons 1 (cons 2 3))))   ;;@ #f
(print (list? (cons 1 (cons 2 '())))) ;;@ #t
(print (length y)) ;;@ 4
(print (list-ref y 2)) ;;@ -3
(print (reverse y)) ;;@ (4 -3 2 -1)
(print (member -3 y)) ;;@ (-3 4)
(print (member 3 y)) ;;@ #f
(print z) ;;@ ((1 . 2) (3 . 4))
(print (assoc 3 z)) ;;@ (3 . 4)
(print (assoc 7 z)) ;;@ #f