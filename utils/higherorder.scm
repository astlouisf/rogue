(define (flip fn)
  (lambda (x y) (fn y x)))


(define (o f g)
 (lambda xs (f (apply g xs))))


(define (foldl fn acc lst)
   (if (null? lst)
       acc
       (foldl fn (fn acc (car lst)) (cdr lst))))


(define (foldr fn acc lst)
   (if (null? lst)
       acc
       (fn (car lst) (foldr fn acc (cdr lst)))))






(define (to-clean-list L)
  (if (list? L)
      L
      (if (null? L)
          L
          (if (pair? (cdr L))
              (cons (car L) (to-clean-list (cdr L)))
              (if (null? (cdr L))
                  L
                  (cons (car L) (cons (cdr L) '())))))))


(define (exists fn lst)
  (if (null? lst)
      #f
      (or (fn (car lst))
          (exists fn (cdr lst)))))


(define (forall fn lst)
  (if (null? lst)
      #f
      (and (fn (car lst))
           (exists fn (cdr lst)))))



(define-macro (while condition . expressions)
  (let ((loop (gensym)))
    `(let ((,loop (lambda (loop)
                    (if ,condition
                        (begin
                         ,@expressions
                         (loop loop))))))
       (,loop ,loop))))
