
(define (f)
  (let* ((x '())
         (g (lambda (i)
              (set! x (cons ((lambda () (cons 'i i))) x)))))
    (h g)
    x))

(define (h fn)
  (fn 2)
  (fn 3))

(print (f)) ;;@ ((i . 3) (i . 2))