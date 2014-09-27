


(define x '(1 2 3))
(define y '(1 2 x))
(define z '(4 5 (x y) '(z 9)))
(define k `(4 5 (x y) (,x ,y)))
(define l '(4 5 (x . y) . (3 . 4)))


(print x) ;;@ (1 2 3)
(print y) ;;@ (1 2 x)
(print z) ;;@ (4 5 (x y) '(z 9))
(print k) ;;@ (4 5 (x y) ((1 2 3) (1 2 x)))
(print l) ;;@ (4 5 (x . y) 3 . 4)
