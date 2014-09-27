

(define f 
  (lambda (x z k) 
    (if k
        (lambda (y) 
          (%+ x (%+ y z))))))

(define g (f 2 10 #t))
(define h (g 3))
(print h) ;;@ 15
