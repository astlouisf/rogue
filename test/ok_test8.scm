;; string testing

(define x "Hello!")
(define y x)
(define z "Hello!")


(print (string? "asd")) ;;@ #t
(print (string? 32)) ;;@ #f

(print (eq? x x)) ;;@ #t
(print (eq? x y)) ;;@ #t
(print (eq? x z)) ;;@ #f
(print (%object-eqv? x z)) ;;@ #t

(print (string-length x)) ;;@ 6