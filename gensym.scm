(include "utils/hash.scm")


(define-type compiler-symbol
  name)

(define (string-hash str) 
  (letrec ((str-l (string->list str))
           (reduce (lambda (x rest) 
                     (if (eq? rest '())
                         x (reduce (+ (* 33 x) (char->integer (car rest))) (cdr rest))))))
    (reduce 5381 str-l)))
;;(map (lambda (x) (+ 1 (* 33 (char->integer x))))

(define compiler-symbol-table (make-hash-table string-hash))

;; note au lecteur attentif: la dernière version ayant écrite 
;; très rapidement voire d'un seul coup, le style en avait souffert.
(define gensym 
  (let ((count 0))
    (lambda () 
      (let ((s (string-append "g" (number->string count))))
        (set! count (+ 1 count))
        (if (eq? (hash-table-ref compiler-symbol-table s) empty-bucket)
            (let ((symb (make-compiler-symbol s)))
              (hash-table-set! compiler-symbol-table s symb)
              symb)
            (gensym) ;; count is now count+1, so we generate until one isnt found
            )))))

(define (symbol->string symb)
  (compiler-symbol-name symb))

(define (string->symbol str)
  (let ((symb (hash-table-ref compiler-symbol-table str)))
    (if (eq? symb empty-bucket)
        (let ((new-symb (make-compiler-symbol str)))
          (hash-table-set! compiler-symbol-table str new-symb)
          new-symb)
        symb)))