(define x #f)
(define y #t)
(define A 65)
(define B 66)
(define lf 10)

(define %putchar (lambda (x) (display (integer->char x))))

(%putchar (if (and) A B))
(%putchar (if (and x) A B))
(%putchar (if (and y) A B))
(%putchar (if (and x x) A B))
(%putchar (if (and x y) A B))
(%putchar (if (and y x) A B))
(%putchar (if (and y y) A B))
(%putchar (if (and x x x) A B))
(%putchar (if (and x x y) A B))
(%putchar (if (and x y x) A B))
(%putchar (if (and x y y) A B))
(%putchar (if (and y x x) A B))
(%putchar (if (and y x y) A B))
(%putchar (if (and y y x) A B))
(%putchar (if (and y y y) A B))
(%putchar lf) ;;@ ABABBBABBBBBBBA

(%putchar (and A A A B))
(%putchar (and B A A A))
(%putchar lf) ;;@ BA
