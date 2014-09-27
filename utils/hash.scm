
(define empty-bucket (gensym))

(define (_vector-foreach v f start stop)
  (if (< start stop)
      (begin (f (vector-ref v start))
             (_vector-foreach v f (+ 1 start) stop))))

;; create a standard open-addressing hash-table using
;; hash function H
(define (make-hash-table H #!key (weak-values #f))
  (make-hash-table-sized H 8 weak-values: weak-values))

(define (make-hash-table-sized H s #!key (weak-values #f))
  (list (cons s 0) (make-vector s empty-bucket) H weak-values))

(define (hash-table-ref-bucket table key create-new)
  (let* ((capacity (car table))
         (data (cadr table))
         (H (caddr table))
         (start (modulo (H key) (car capacity))))
    (letrec
        ((search 
          (lambda (offset)
            (let* ((position (modulo (+ start offset) (- (car capacity) 1)))
                   (bucket (vector-ref data position)))
              (if (pair? bucket)
                  (if (not (equal? (car bucket) key))
                      (search (+ 1 offset))
                      bucket)
                  (if create-new
                      (let ((new-bucket (cons key 0)))
                        (vector-set! data position
                                     new-bucket)
                        new-bucket)
                      empty-bucket))))))
      (search 0))))

(define (hash-table-ref table key)
  (let ((v (hash-table-ref-bucket table key #f))
        (weak-values (cadddr table)))
    (display "weak:")(pp weak-values)
    (if (eq? v empty-bucket)
        v
        (if weak-values
            (begin
              (pp (cdr v))
              (pp (will-testator (cdr v)))
              (will-testator (cdr v)))
            (cdr v)))))

(define (hash-table-set! table key value)
  (let ((v (hash-table-ref-bucket table key #t))
        (weak-values (cadddr table)))
    (if weak-values
        (set-cdr! v (make-will value (lambda (x) #!void)))
        (set-cdr! v value))
    (set-cdr! (car table) (+ 1 (cdar table)))
    (if (>= (cdar table) (* 3/4 (caar table)))
        (hash-table-grow! table))))

(define (hash-table-grow! table)
  (display "Growing ")(pp (car table))
  (let* ((capacity (car table))
         (data (cadr table))
         (H (caddr table))
         (weak (cadddr table))
         (new-data (make-vector (* (car capacity) 2) empty-bucket)))
    (set-car! (cdr table) new-data)
    (set-car! (car table) (* 2 (car capacity)))
    (set-cdr! (car table) 0)
    (_vector-foreach 
     data
     (lambda (x)
       (if (not (eq? x empty-bucket))
           (hash-table-set! table (car x) 
                            (if weak
                                (will-testator (cdr x))
                                (cdr x)))))
     0 (/ (car capacity) 2))))
    

(define (test-hash-tables)
  (define t (make-hash-table symbol-hash))
  (define count 0)
  (display "Testing hash tables...\n")
  (hash-table-set! t 'a 10)
  (if (not (= (hash-table-ref t 'a) 10)) (pp "Wrong mapping for 'a"))
  (hash-table-set! t 'b 11)
  (hash-table-set! t 'c 12)
  (hash-table-set! t 'd 13)
  (hash-table-set! t 'a 14)
  (if (not (= (hash-table-ref t 'a) 14)) (pp "Wrong mapping for 'a"))
  (if (not (= (hash-table-ref t 'b) 11)) (pp "Wrong mapping for 'b"))
  (if (not (= (hash-table-ref t 'c) 12)) (pp "Wrong mapping for 'c"))
  (if (not (= (hash-table-ref t 'd) 13)) (pp "Wrong mapping for 'd"))
  
  (set! t (make-hash-table symbol-hash weak-values: #t))
  (map (lambda (x) (hash-table-set! t (string->symbol (string x))
                                    count)
               (set! count (+ 1 count)))
       (string->list "abcdefghijkl"))
  (set! count 0)
  (map (lambda (x) 
         (if (not (= (hash-table-ref t (string->symbol (string x)))
                     count))
             (pp "Wrong mapping for string->list"))
         (set! count (+ 1 count)))
       (string->list "abcdefghijkl"))
  (pp t))
