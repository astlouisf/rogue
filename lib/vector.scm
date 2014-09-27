
(define (vector? x)
  (and (%object? x)
       (= (%object-type x) type-uid-vector)))

(define (make-vector L . o)
  (let ((newvec (%object-new type-uid-vector (* 8 L))))
    (if (not (null? o))
        (let* ((x (car o))
               (fill (lambda (f i)
                       (if (< i L)
                           (begin
                             (%object-setraw newvec i x)
                             (f f (+ 1 i)))))))
          (fill fill 0)))
    newvec))
          
(define vector
  (lambda objs
    (list->vector objs)))

(define (list->vector L)
  (if (list? L)
      (let* ((len (length L))
             (newvec (%object-new type-uid-vector (* 8 len)))
             (fill (lambda (f p i)
                     (if (not (null? p))
                         (begin
                           (%object-setraw newvec i (car p))
                           (f f (cdr p) (+ 1 i)))))))
        (fill fill L 0)
        newvec)
      (error "*** ERROR in list->vector: Argument not a list" L)))

(define (vector-ref v i)
  (if (vector? v)
      (if (< i (quotient (%object-length v) 8))
          (%object-getraw v i)
          (error "*** ERROR in vector-ref: index out of bounds" v i))
      (error "*** ERROR in vector-ref: Argument not a vector" v)))


(define (vector-set! v i x)
  (if (vector? v)
      (if (< i (quotient (%object-length v) 8))
          (%object-setraw v i x)
          (error "*** ERROR in vector-set!: index out of bounds" v i))
      (error "*** ERROR in vector-set!: Argument not a vector" v)))


(define (vector-length v)
  (if (vector? v)
      (quotient (%object-length v) 8)
      (error "*** ERROR in vector-length: Argument not a vector" v)))

(define (%print-vector x i L port)
  (if (< i L)
      (begin
        (write (vector-ref x i) port)
        (if (not (= (+ 1 i) L))
            (begin
              (write-char #\space port)
              (%print-vector x (+ 1 i) L port))))))

        
        