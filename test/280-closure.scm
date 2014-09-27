
(define f 
  (let ((n 0))
    (lambda ()
      (set! n (+ 1 n))
      n)))

(print (f)) ;;@ 1
(print (f)) ;;@ 2
(print (f)) ;;@ 3
