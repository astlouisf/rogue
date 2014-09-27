
(define + (lambda L
            (if (null? L)
                0
                (%+ (car L) (apply + (cdr L))))))
(define * (lambda L
            (if (null? L)
                1
                (%* (car L) (apply * (cdr L))))))
(define - (lambda (x . L)
            (if (null? L)
                (%- 0 x)
                (%- x (apply + L)))))
(define quotient (lambda (x y) (%quotient x y)))
(define modulo (lambda (x y) (%modulo x y)))
(define = (lambda (x y) (%= x y)))
(define < (lambda (x y) (%< x y)))
(define > (lambda (x y) (not (%<= x y))))
(define <= (lambda (x y) (%<= x y)))
(define >= (lambda (x y) (not (%< x y))))

(define sum (lambda (L)
              (if (eq? L '())
                  0
                  (+ (car L)
                     (sum (cdr L))))))

;; this function gives the ceiling of the log in base b of n
(define (ilog n b)
  (if (= 0 n)
      0
      (+ 1 (ilog (quotient n b) b))))


(define (pow x a)
  (if (= 0 a)
      1
      (* x (pow x (- a 1)))))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define integer->string
  (lambda (x)

    (define (range start stop)
      (if (>= start stop)
          '()
          (cons start (range (+ 1 start) stop))))
    (cond 
     ((eq? 0 x)
      (string-append "0"))
     ((< x 0)
      (string-append "-" (integer->string (- x))))
     (else
      (let* ((length (ilog x 10))
             (newstr (%object-new type-uid-string (%word-ceil (+ 1 length)))))
        (for-each (lambda (i)
                    (%object-setb newstr i 
                                  (+ (char->integer #\0)
                                     (modulo (quotient x (pow 10 (- length (+ 1 i)))) 10))))
                  (range 0 length))
        (%object-setb newstr length 0)
        newstr)))))
             
     
(define number->string integer->string)
