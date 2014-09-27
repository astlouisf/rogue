
(define null? (lambda (x) (%eq? x '())))

(define cons (lambda (x y) (%cons x y)))
(define car (lambda (x) (if (not (pair? x))
                            (error "*** ERROR pair expected in car got:" x))
                    (%car x)))
(define cdr (lambda (x) (if (not (pair? x))
                            (error "*** ERROR pair expected in car got:" x))
                    (%cdr x)))
(define caar (lambda (x) (%car (%car x))))
(define cadr (lambda (x) (%car (%cdr x))))
(define cdar (lambda (x) (%cdr (%car x))))
(define cddr (lambda (x) (%cdr (%cdr x))))
(define caaar (lambda (x) (%car (%car (%car x)))))
(define caadr (lambda (x) (%car (%car (%cdr x)))))
(define cadar (lambda (x) (%car (%cdr (%car x)))))
(define cdaar (lambda (x) (%cdr (%car (%car x)))))
(define caddr (lambda (x) (%car (%cdr (%cdr x)))))
(define cdadr (lambda (x) (%cdr (%car (%cdr x)))))
(define cddar (lambda (x) (%cdr (%cdr (%car x)))))
(define cdddr (lambda (x) (%cdr (%cdr (%cdr x)))))
(define caaaar (lambda (x) (%car (%car (%car (%car x))))))
(define caaadr (lambda (x) (%car (%car (%car (%cdr x))))))
(define caadar (lambda (x) (%car (%car (%cdr (%car x))))))
(define cadaar (lambda (x) (%car (%cdr (%car (%car x))))))
(define cdaaar (lambda (x) (%cdr (%car (%car (%car x))))))
(define caaddr (lambda (x) (%car (%car (%cdr (%cdr x))))))
(define cadadr (lambda (x) (%car (%cdr (%car (%cdr x))))))
(define cdaadr (lambda (x) (%cdr (%car (%car (%cdr x))))))
(define cdadar (lambda (x) (%cdr (%car (%cdr (%car x))))))
(define cddaar (lambda (x) (%cdr (%cdr (%car (%car x))))))
(define caddar (lambda (x) (%car (%cdr (%cdr (%car x))))))
(define cadddr (lambda (x) (%car (%cdr (%cdr (%cdr x))))))
(define cdaddr (lambda (x) (%cdr (%car (%cdr (%cdr x))))))
(define cddadr (lambda (x) (%cdr (%cdr (%car (%cdr x))))))
(define cdddar (lambda (x) (%cdr (%cdr (%cdr (%car x))))))
(define cddddr (lambda (x) (%cdr (%cdr (%cdr (%cdr x))))))

(define set-car! (lambda (x y) (%set-car! x y)))
(define set-cdr! (lambda (x y) (%set-cdr! x y)))
(define pair? (lambda (x) (and (not (null? x)) (%pair? x))))
(define list? (lambda (x) (if (pair? x)
                              (if (pair? (cdr x))
                                  (list? (cdr x))
                                  (if (null? (cdr x)) #t #f))
                              (if (null? x)
                                  #t #f))))
(define length (lambda (x) 
                 (let ((length 
                        (lambda (x i f)
                          (if (null? x)
                              i
                              (f (cdr x) (+ 1 i) f)))))
                   (if (list? x)
                       (length x 0 length)
                       (error "*** ERROR in length: list expected")))))

(define list (lambda L L))

(define (%append x R)
  (if (list? x)
      (if (null? x)
          (if (null? R)
              '()
              (%append (car R) (cdr R)))
          (cons (car x) (%append (cdr x) R)))
      (error "*** ERROR in append: List expected")))

(define append 
  (lambda R
    (if (null? R)
        '()
        (%append (car R) (cdr R)))))


(define list-ref
  (lambda (L i)
    (let ((loop
           (lambda (L i f)
             (if (not (pair? L))
                 (error "*** ERROR in list-ref: index out of bounds")
                 (if (= i 0)
                     (car L)
                     (f (cdr L) (- i 1) f))))))
      (if (pair? L)
          (loop L i loop)
          (error "*** ERROR in list-ref: pair expected")))))

(define list-set!
  (lambda (L i v)
    (let ((loop
           (lambda (L i f)
             (if (not (pair? L))
                 (error "*** ERROR in list-ref: index out of bounds")
                 (if (%= i 0)
                     (%set-car! L v)
                     (f (%cdr L) (%- i 1) f))))))
      (if (pair? L)
          (loop L i loop)
          (error "*** ERROR in list-ref: pair expected")))))



(define reverse
  (lambda (L)
    (let ((loop 
           (lambda (rest new loop)
             (if (null? rest)
                 new
                 (loop (cdr rest) (cons (car rest) new) loop)))))
    (if (list? L)
        (loop L '() loop)
        (error "*** ERROR in reverse: list expected")))))

(define pair-equal?
  (lambda (x y)
    (if (and (pair? x) (pair? y))
        (if (equal? (car x) (car y))
            (if (and (null? (cdr x)) (null? (cdr y)))
                #t
                (pair-equal? (cdr x) (cdr y)))
            #f) #f)))


(define (listrange start stop)
  (if (>= start stop)
      '()
      (cons start (listrange (+ 1 start) stop))))