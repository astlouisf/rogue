(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(define numx (%number? x))
(define numy (%number? y))
(define numA (%number? A))


(%putchar (if numx A B))
(%putchar (if numy A B))
(%putchar (if numA A B))
(%putchar lf) ;;@ BBA