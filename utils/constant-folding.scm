
(define (all x)
  (if (null? x)
      #t
      (and (car x) (all (cdr x)))))


(define (is-constant-expr x)
  (or 
   (number? x)
   (string? x)
   (char? x)))
   

(define known-ops
  `((+ . ,+)
    (* . ,*)
    (- . ,-)
    (quotient . ,(lambda (x y)
                   (if (eq? 0 y)
                       `(quotient ,x ,y)
                       (quotient x y))))
    (modulo . ,modulo)
    (string-append . ,string-append)))

(define (fold-constants ast)
  (fold-constants-env ast '()))
           
(define (fold-constants-env ast env)
  (if (list? ast)
      (begin
        (match ast 
         ((x bindings . body) where (member x '(let %let))
          `(,x ,bindings
             ,@(fold-constants-env body (append bindings env)))) 
         ((x bindings . body) where (member x '(lambda %lambda))
          `(,x ,bindings
             ,@(fold-constants-env body (append (map (lambda (x) (cons x 0)) 
                                                     (if (pair? bindings)
                                                         (to-clean-list bindings)
                                                         (list bindings)))
                                                env)))) 
         (_
          (let ((newast (map (lambda (x) (fold-constants-env x env)) ast)))
            (match newast
             ((op . args) where (and 
                                 (not (assoc op env))
                                 (assoc op known-ops))
              (if (all (map is-constant-expr args))
                  (apply (cdr (assoc op known-ops)) args)
                  newast))
             (_ newast))))))
      ast))

;(pp (fold-constants '(let ((x 1) (+ 32)) (* (* + x) (* 4 4)))))