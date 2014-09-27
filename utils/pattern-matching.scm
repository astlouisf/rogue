
;; Binds variables that are visible to the condition and the then-clause.
;; We need to do this because a branch could overide an accessible variable
;; that is used in a following branch.
(define-macro (binded-if bindings condition then-clause else-clause)
  (let ((thunk (gensym)))
    `(let ((,thunk (let ,bindings
                       (cons (lambda () ,condition)
                             (lambda () ,then-clause)))))
       (if ((car ,thunk))
           ((cdr ,thunk))
           ,else-clause))))


;;
;; Pattern matching macro provided by Marc Feeley. Some changes to variable
;; names have been done to make it easier to understand and extend.
;;
;; Symbols match with their symbol definition.
;;   ex: (match 'x ('x 3))
;;
;; Pattern can assign a value to a variable
;;   ex: (match 5 (x x)) 5 is assigned to x
;;
;; Underscores match anything. An underscore case can be used
;; as an else/default clause. Underscores won't create any binding.
;;   ex: (match 5 (_ "don't care")) => don't care
;;
;; A pattern where . is second to last should have a variable as a last
;; argument which wil match the tail of the list.
;;   ex: (match (list 1 2 3 4 5) ((head . tail) tail)) => (2 3 4 5)
;;
(define-macro (match subject . rest)

(define (filter fn lst)
  (reverse
   (foldl (lambda (acc x)
             (if (fn x)
                 (cons x acc)
                 acc))
          '()
          lst)))

;; Split a list on first "false element".
(define (split fn lst)
  (if (null? lst)
      `(() . ())
      (let ((x (car lst)))
        (if (fn x)
            (let ((s (split fn (cdr lst))))
              (cons (cons x (car s))
                    (cdr s)))
            (cons `() lst)))))

;; Recursively build partition from the bottom.
(define (partition fn lst)
  (if (null? lst)
      `(() . ())
      (let* ((new-p   (partition fn (cdr lst)))
             (left-p  (car new-p))
             (right-p (cdr new-p)))
        (if (fn (car lst))
            `((,(car lst) . ,left-p) . ,right-p)
            `(,left-p . (,(car lst) . ,right-p))))))
(define (foldl fn acc lst)
   (if (null? lst)
       acc
       (foldl fn (fn acc (car lst)) (cdr lst))))


  (define (parse-pattern expression pattern)
    (cond
     ((null? pattern)
      `((condition (null? ,expression))))

     ;; Match symbols
     ;; ex: (match 'a ('a 1)) => 1
     ((and (list? pattern)
           (= 2 (length pattern))
           (eq? 'quote (car pattern)))
      `((condition (equal? ,expression ',@(cdr pattern)))))

     ;;Symbols should create assignation
     ((symbol? pattern)
      `((assignement (,pattern ,expression))))

     ((or (number? pattern)
          (char?   pattern)
          (string? pattern))
      `((condition (equal? ,expression ,pattern))))

     ((pair? pattern)
      (append `((condition (pair? ,expression)))
              (parse-pattern `(car ,expression) (car pattern))
              (parse-pattern `(cdr ,expression) (cdr pattern))))
     (else
      (error "unknown pattern"))))


  (define (gen-exp expressions)
    (if (= 0 (length expressions))
        (error "missing expression in pattern")
        `(begin ,@expressions)))

  (define (gen-branches ces err)
    (if (null? ces)
        `(,err)
        (let* ((ce (car ces))
               (conditions   (car    ce))
               (assignements (cadr   ce))
               (guard        (caddr  ce))
               (expression   (cadddr  ce)))
          (if (null? conditions)
              (if (null? assignements)
                  (if (null? guard)
                    (gen-exp expression)
                    `(if ,guard
                         ,(gen-exp expression)
                         ,(gen-branches (cdr ces) err)))
                  (if (null? guard)
                    `(let ,assignements ,(gen-exp expression))
                    `(binded-if ,assignements
                                ,guard
                                ,(gen-exp expression)
                                ,(gen-branches (cdr ces) err))))

              (let* ((cnd1 (car conditions))
                     (s    (split (lambda (ce)
                                    (let ((c (car ce)))
                                      (and (pair? c)
                                           (equal? (car c)
                                                   cnd1))))
                                  ces))
                     (ces1 (car s))
                     (ces2 (cdr s))
                     (err2 `(lambda () ,(gen-branches ces2 err)))
                     (else-thunk (gensym)))
                (if (null? ces2)
                   `(if ,cnd1
                        ,(gen-branches
                          (map (lambda (ce)
                                 `(,(cdr (car ce)) . ,(cdr ce)))
                               ces1)
                          err)
                         (,err))
                   `(let ((,else-thunk ,err2))
                      (if ,cnd1
                          ,(gen-branches
                            (map (lambda (ce)
                                   `(,(cdr (car ce)) . ,(cdr ce)))
                                 ces1)
                            else-thunk)
                          (,else-thunk)))))))))


  (define (parse-branches name clauses)
   (map (lambda (clause)
          (let* ((parsed-pattern (partition
                                  (lambda (x) (eq? 'condition (car x)))
                                  (parse-pattern name (car clause))))
                 (conditions     (map cadr (car parsed-pattern)))

                 (assignement    (filter
                                  (lambda (x) (not (eq? '_ (car x))))
                                  (map cadr (cdr parsed-pattern))))

                 (guard          (if  (and (> (length clause) 3)
                                           (eq? 'where (cadr clause)))
                                      (caddr clause)
                                      '()))
                 (expressions    (if (null? guard)
                                     (cdr clause)
                                     (cdddr clause))))
            `(,conditions ,assignement ,guard ,expressions)))
        clauses))


  (define (gen subject name clauses)
    (let ((else-thunk (gensym)))
      `(let ((,name ,subject)
             (,else-thunk (lambda () (error "match failed"))))
         ,(gen-branches
           (parse-branches name clauses)
           else-thunk))))

  (cond
   ((and (> (length rest) 2)
         (equal? 'as (car rest)))
    (gen subject (cadr rest) (cddr rest)))
   ((> (length rest) 0)
    (gen subject (gensym) rest))
   (else
    (error "Pattern-matching: There needs to be at least one clause."))))


(define (test-match expression)
  (match expression as lol
    ((_ . r) r)
    (a where (and (number? a) (> a 1))
             a)
    (#\) "deux" (display "side-effect: ") "2")
    ('c "trois" "quatre" "cinq")
    ((a 'b)  (cons a lol))
    (_ "else")))

