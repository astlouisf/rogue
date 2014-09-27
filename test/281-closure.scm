
(define k (lambda (x) (%+ 1 x)))
(define f 0)
(define g 0)
(define __
  ((lambda ()
     (%set! f (lambda (x) (k x)))
     (%set! g (lambda (y) (f y))))))
(print (f 65)) ;;@ 66