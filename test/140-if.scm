(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(%putchar (if #f A B))
(%putchar (if #t A B))
(%putchar lf) ;;@ BA

(%putchar (if x A B))
(%putchar (if y A B))
(%putchar lf) ;;@ BA

(%putchar (if 0 A B))
(%putchar (if 1 A B))
(%putchar lf) ;;@ AA
