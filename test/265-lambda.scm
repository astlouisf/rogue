(define f (lambda (n) (lambda (x) n)))

(define g (f 73))

(define z (g 74))

(%putchar z)
(%putchar 10) ;;@ I
