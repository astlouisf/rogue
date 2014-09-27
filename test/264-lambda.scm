(define f (lambda (n) (lambda (x) x)))

(define g (f 73))

(define z (g 74))

(%putchar z) ;;@ J
(%putchar 10)
