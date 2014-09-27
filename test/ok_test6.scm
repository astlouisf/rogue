

(define y
  (lambda (j) 1000))

(define x 
  (lambda (i)
    (if (= 0 i)
        42
        (y (- i 1)))))

(print 312) ;;@ 312
(print (x 0)) ;;@ 42