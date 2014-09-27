(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(%putchar (if (%number? x) A B))
(%putchar (if (%number? y) A B))
(%putchar (if (%number? A) A B))
(%putchar lf) ;;@ BBA
