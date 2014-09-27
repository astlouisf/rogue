
(define (f x)
  (let ((g (lambda (i) 
             (begin
               (set! x (string-append x x))
               (string-append x i))))
        (k "b"))
    (let ((h (lambda ()
               (set! k (string-append k "b")))))
      (print (g k)) ;;@ aab
      (h)
      (print x) ;;@ aa
      (g k))))

(print (f "a")) ;;@ aaaabb