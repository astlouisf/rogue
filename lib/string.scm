
(define char? (lambda (x) (if (%object? x)
                              (= (%object-type x) type-uid-char)
                              #f)))

(define eof-object? (lambda (x) (eq? x #!eof)))

(define integer->char
  (lambda (x)
    (let ((o (%object-new type-uid-char 8)))
      (begin
        (%object-setq o 0 x)
        o))))
(define char->integer
  (lambda (x)
    (%object-getq x 0)))

(define (char=? x y)
  (if (and (char? x) (char? y))
      (= (char->integer x) (char->integer y))
      #f))
(define (char<=? x y)
  (<= (char->integer x) (char->integer y)))
(define (char>=? x y)
  (>= (char->integer x) (char->integer y)))


(define string? (lambda (x) (if (%object? x)
                                (= (%object-type x) type-uid-string)
                                #f)))
(define string-length 
  (lambda (x)
    (let ((loop (lambda (loop i s)
                  (if (= (%object-getb s i) 0)
                      i
                      (loop loop (+ 1 i) s)))))
      (if (string? x)
          (loop loop 0 x)
          (begin
            (print x)
            (print (%object? x))
            (print (%object-type x))
            (print (pair? x))
            (error "*** ERROR in string-length: Argument not a string"))))))

(define string-ref
  (lambda (s i)
    (if (string? s)
        (integer->char (%object-getb s i))
        (error "*** ERROR in string-ref: Argument not a string"))))

(define string-set!
  (lambda (s i c)
    (if (and (string? s) (char? c))
        (%object-setb s i (char->integer c))
        (error "*** ERROR in string-set!"))))

(define string
  (lambda C
    (if (member #f (map char? C))
        (error "*** ERROR in string, argument is not a character"))
    (let* ((len (length C))
           (newstr (%object-new type-uid-string (%word-ceil (+ 1 len))))
           (fill-new
            (lambda (i L f)
              (if (not (null? L))
                  (begin
                    (%object-setb newstr i (char->integer (car L)))
                    (f (+ 1 i) (cdr L) f))
                  (%object-setb newstr i 0)))))
      (fill-new 0 C fill-new)
      newstr)))
          
 
(define string-append
  (lambda S
    (let ((lengths (map string-length S)))
      (let ((plengths (partial-sum partial-sum 0 lengths))
            (length (sum lengths)))
        (let ((newstr (%object-new type-uid-string (%word-ceil (+ 1 length))))
              (fill-new
               (lambda (newstr str i j L f)
                 (if (and #f (> (- L i) 8))
                     ;; moving a quad at a time doesn't work because
                     ;; we only work with 62 bits (and we're trying to
                     ;; copy 64)
                     (begin
                       (%object-setq newstr (quotient j 8) 
                                     (%object-getq str (quotient i 8)))
                       (f newstr str (+ 8 i) (+ 8 j) L f))
                     (begin
                       (%object-setb newstr j (%object-getb str i))
                       (if (and (not (= 0 (%object-getb str i)))
                                (< i L))
                           (f newstr str (+ 1 i) (+ 1 j) L f)))))))
          (map fill-new 
               (map (lambda x newstr) S)
               S 
               (map (lambda x 0) S)
               (cons 0 plengths)
               lengths
               (map (lambda x fill-new) S))
          (%object-setb newstr length 0)
          newstr)))))


(define string-equal?
  (lambda (x y)
    (if (and (string? x) (string? y))
        (if (= (%object-length x)
               (%object-length y))
            (%object-eqz? x y)
            #f)
        #f)))

(define (substring s start stop)
  (if (or (< start 0)
       (> start (string-length s))
       (> stop (string-length s)))
      (error "*** Error in substring index out of range"))
  (let* ((newstr (%object-new type-uid-string (%word-ceil (+ 1 (- stop start)))))
         (fill-new
          (lambda (i f)
            (if (and (not (= 0 (%object-getb s i)))
                     (< (+ start i) stop))
                (begin
                  (%object-setb newstr i (%object-getb s (+ start i)))
                  (f (+ 1 i) f))))))
    (fill-new 0 fill-new)
    newstr))
    
(define (string->number s)
  (letrec ((loop
            (lambda (acc i L)
              (if (and (not (= 0 (%object-getb s i)))
                       (< i L))
                  (let ((c (%object-getb s i)))
                    (if (and (>= c 48) ;; 0 is 48 in ascii
                             (<= c 58))
                        (loop (+ (* 10 acc) (- c 48)) (+ 1 i) L)
                        #f))
                   acc))))
    (loop 0 0 (string-length s))))