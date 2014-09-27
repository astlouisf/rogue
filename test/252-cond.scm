(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define C 67)
(define lf 10)

(cond (x (%putchar A))
      (x (%putchar B))
      (else (%putchar C))) 

(cond (x (%putchar A))
      (y (%putchar B))
      (else (%putchar C)))

(cond (y (%putchar A))
      (x (%putchar B))
      (else (%putchar C)))

(cond (y (%putchar A))
      (y (%putchar B))
      (else (%putchar C)))

(%putchar lf) ;;@ CBAA
