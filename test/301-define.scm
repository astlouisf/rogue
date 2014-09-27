(define (f x)
  (define (g y)
    (+ x y))
  (g (+ 1 x)))

(print (f 10)) ;;@ 21