(define A 65)
(define B 66)
(define lf 10)

(%putchar (if (%< A A) A B)) 
(%putchar (if (%< A B) A B))
(%putchar (if (%< B A) A B))
(%putchar (if (%< B B) A B))
(%putchar lf) ;;@ BABB
