(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(cond (#f (%putchar A)) (else (%putchar B)))
(cond (#t (%putchar A)) (else (%putchar B)))
(%putchar lf) ;;@ BA

(cond (x (%putchar A)) (else (%putchar B)))
(cond (y (%putchar A)) (else (%putchar B)))
(%putchar lf) ;;@ BA

(cond (0 (%putchar A)) (else (%putchar B)))
(cond (1 (%putchar A)) (else (%putchar B)))
(cond (x (%putchar B)))
(%putchar lf) ;;@ AA
