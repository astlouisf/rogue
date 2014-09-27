(include "test/400-include.scm")

(define (g x) (+ x 10))

(print (f (g 1))) ;;@ 22