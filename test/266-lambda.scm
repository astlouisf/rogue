(define f (lambda (n) (lambda (x) (%+ n x))))

(define g (f 73))

(define z (g 33))

(%putchar z) 
(%putchar 10) ;;@ j
