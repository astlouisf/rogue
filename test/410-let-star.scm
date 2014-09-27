
(define (g x y)
  (let* ((z (%+ x y))
         (k (%* z y))
         (m (%+ x k)))
    (%print m)
    (%putchar 10)))


(g 10 2) ;;@ 34
(g 100 3) ;;@ 409