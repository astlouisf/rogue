(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(%putchar (cond (#f A) (else B)))
(%putchar (cond (#t A) (else B)))
(%putchar lf) ;;@ BA

(%putchar (cond (x A) (else B)))
(%putchar (cond (y A) (else B)))
(%putchar lf) ;;@ BA

(%putchar (cond (0 A) (else B)))
(%putchar (cond (1 A) (else B)))
(%putchar lf) ;;@ AA
