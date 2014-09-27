;(define x 'test)
;(define y 'd)
;(define z '())

;(print z)
;(define x "Hello World")

(define y (cons 123 234))
(print (car y)) ;;@ 123
(print (car (cdr (cons 123 (cons 456 789))))) ;;@ 456
(print (cdr (cdr (cons 123 (cons 456 789))))) ;;@ 789

;(print (string? x))
;(print (string? 42))
;(print (* (+ 2 3) 14))