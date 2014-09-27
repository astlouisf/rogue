
;; these definitions should reflect utils/type-uid.scm
(define type-uid-procedure 0)
(define type-uid-pair 2)
(define type-uid-string 42)
(define type-uid-symbol 43)
(define type-uid-char   44)
(define type-uid-vector 45)
(define type-uid-closure 96)
(define type-uid-machine-code 97)


(define error (lambda (s . R) (print s) (map print R) (%exit 1)))
;(define error (lambda (s) (print s) (%exit 1)))
(define exit (lambda (n) (%exit n)))
(define print (lambda (x . port) (apply display (cons x port)) (newline)))
(define pp print)
(define pretty-print print)
(define display  
  (lambda (x . port)
    (let ((port (if (null? port)
                    port
                    (car port))))
      (if (string? x)
          (%print-string x 0 port)
          (write x port)))))


(define write
  (lambda (x . port)
    (let ((port (if (null? port)
                    port
                    (car port))))
      (cond
       ((string? x)
        (write-char #\" port)
        (%print-string x 0 port)
        (write-char #\" port))
       ((eq? x '())
        (write-char #\( port)
        (write-char #\) port))
       ((eof-object? x)
        (write-char #\# port)
        (write-char #\! port)
        (%print-string "eof" 0 port))
       ((char? x)
        (write-char #\# port)
        (write-char #\\ port)
        (write-char x port))
       ((symbol? x)
        (%print-string x 0 port))
       ((pair? x)
        (if (eq? (car x) 'quote)
            (begin 
              (write-char #\' port)
              (write (cadr x) port))
            (begin (write-char #\( port)
                   (%print-pair x port) 
                   (write-char #\) port))))
       ((vector? x)
        (write-char #\# port)
        (write-char #\( port)
        (%print-vector x 0 (vector-length x) port) 
        (write-char #\) port))
       ((procedure? x)
        (display "<procedure>" port))
       (else
        (%port-print x port))))))

(define (%port-print s port)
  (if (null? port)
      (%print s)
      (write-string (number->string s) port)))


(define write-char 
  (lambda (x . port) 
    (if (not (char? x))
        (error "*** ERROR char-expected in write-char"))
    (let ((port (if (null? port)
                    port
                    (car port))))
      (if (null? port)
          (%putchar (char->integer x))
          (%write-char x port)))))
(define newline (lambda () (%putchar 10)))
(define getchar (lambda () (integer->char (%getchar))))


(define %print-string
  (lambda (x i port)
    (let ((v (%object-getb x i)))
      (if (%= v 0)
          0
          (begin (write-char (integer->char v) port)
                 (%print-string x (%+ 1 i) port))))))

(define %print-pair
  (lambda (x port)
    (let ((port (if (null? port)
                    port
                    (car port))))
      (if (not (null? x))
          (begin
            (write (car x) port)
            (if (not (null? (cdr x)))
                (begin (write-char #\space port)
                       (if (pair? (cdr x))
                           (%print-pair (cdr x) port)
                           (begin (write-char #\. port)
                                  (write-char #\space port)
                                  (write (cdr x) port))))))))))

(define (boolean? x)
  (or (eq? x #f) (eq? x #t)))

(define equal? 
  (lambda (x y)
    (if (eq? x y)
        #t
        (if (string-equal? x y)
            #t
            (if (pair-equal? x y)
                #t
                (if (char=? x y)
                    #t
                    #f))))))

(define %error_nargs 
  (lambda (x y)
    (display "Wrong number of arguments passed to procedure, got: ")
    (display y)
    (if (< x 0)
        (begin (display ", expected at least: ")
               (print (- 0 x)))
        (begin (display ", expected: ")
               (print x)))
    (%exit 1)))

(define not (lambda (x) (if x #f #t)))

(define number? (lambda (x) (%number? x)))
(define %word-ceil (lambda (x) (* 8 (+ 1 (quotient x 8)))))

(define member
  (lambda (x L)
    (let ((loop
           (lambda (x L loop)
             (if (pair? L)
                 (if (equal? (car L) x)
                     L
                     (loop x (cdr L) loop))
                 #f))))
      (if (or (null? L) (pair? L))
          (loop x L loop)
          (error "*** ERROR in member: list expected")))))

(define assoc
  (lambda (x L)
    (let ((loop
           (lambda (x L loop)
             (if (pair? L)
                 (if (pair? (car L))
                     (if (equal? (car (car L)) x)
                         (car L)
                         (loop x (cdr L) loop))
                     (error "*** ERROR in assoc: pair list expected"))
                 #f))))
      (if (or (pair? L) (null? L))
          (loop x L loop)
          (begin
            (print x)
            (print L)
            (error "*** ERROR in assoc: list expected"))))))
    


(define procedure? (lambda (x) (if (%object? x)
                                   (or (= (%object-type x) type-uid-procedure)
                                       (= (%object-type x) type-uid-closure))
                                   #f)))
(define closure? (lambda (x) (if (%object? x)
                                 (= (%object-type x) type-uid-closure)
                                 #f)))
(define apply 
  (lambda (f args)
    (if (not (list? args))
        (error "Cannot apply procedure to non-list arguments"))
    (if (not (procedure? f))
        (error "Cannot apply to a non-procedure"))
    (if (closure? f)
        (%apply-closure f args)
        (%apply f args))))



(define partial-sum 
  (lambda (f acc L)
    (if (eq? L '())
        '()
        (let ((v (+ acc (car L))))
          (cons v (f f v (cdr L)))))))

(define eq? (lambda (x y) (%eq? x y)))

(define eqv?
  (lambda (x y)
    (if (eq? x y)
        #t
        (if (and (char? x) (char? y))
            (if (= (char->integer x) (char->integer y)) #t #f)
            #f))))

(define %sym-table '())
(define symbol? (lambda (x) 
                  (if (%object? x)
                      (if (not (null? x))
                          (= (%object-type x) type-uid-symbol)
                          #f)
                      #f)))
(define symbol->string 
  (lambda (x) 
    (if (symbol? x)
        (let ((new-str (%object-new type-uid-string
                                    (%object-length x)))
              (fill-new
               (lambda (str new i L fill-new)
                 (%object-setb new i (%object-getb str i))
                 (if (and (not (= 0 (%object-getb str i)))
                          (< i L))
                     (fill-new str new (+ 1 i) L fill-new)
                     (%object-setb new (+ 1 i) 0)))))
          (fill-new x new-str 0 (%object-length x) fill-new)
          new-str)
        (error "error in symbol->string, got:" x))))

(define string->symbol
  (lambda (s)
    (let ((sym-match 
           (lambda (x y)
             (begin
               (if (and (string? x) (symbol? y))
                   ;(eq? x (symbol->string y))
                   (if (= (%object-length x)
                          (%object-length y))
                       (%object-eqz? x y)
                       #f)
                   #f))))
           
          (match-loop
           (lambda (s L loop sym-match)
             (begin
               (if (null? L)
                       #f
                       (if (sym-match s (car L))
                           (car L)
                           (loop s (cdr L) loop sym-match))))))
          (fill-new
           (lambda (str new i fill-new)
             (%object-setb new i (char->integer (string-ref str i)))
             (if (< i (+ 1 (string-length str)))
                 (fill-new str new (+ 1 i) fill-new)
                 (%object-setb new i 0)))))
      (if (not (string? s))
          (error "Error 12982"))
      (let ((v (match-loop s %sym-table match-loop sym-match)))
        (begin
          ;(print "match:")
          ;(print v)
        (if v
            v
            (let ((new-sym (%object-new type-uid-symbol 
                                        (%object-length s))))
              (fill-new s new-sym 0 fill-new)
              ;;(print "newsym:")(print new-sym)
              (%set! %sym-table (cons new-sym %sym-table))
              new-sym)))))))

(define (unimap fun L)
  (if (null? L)
      '()
      (cons (fun (car L)) 
            (unimap fun (cdr L)))))

(define multimap 
  (lambda (fun lsts)
    (if (or (null? lsts) (member '() lsts))
        '()
        (cons (apply fun (unimap car lsts)) 
              (multimap fun (unimap cdr lsts))))))

(define (map fun . lsts)
  (multimap fun lsts))

(define (for-each fun lst)
  (if (not (null? lst))
      (begin
        (fun (car lst))
        (for-each fun (cdr lst)))))


;; TODO!
(define (eval code)
  (print "****************** EVAL")
  1)

(define %gensym-count 0)
(define gensym
    (lambda x 
      (set! %gensym-count (+ 1 %gensym-count))
      (if (null? x)
          (string->symbol
           (string-append "g" (integer->string %gensym-count)))
          (string->symbol
           (string-append (symbol->string (car x)) (integer->string %gensym-count))))))
(define verbose #f)
(define %define-export-list 0)

(include "lib/list.scm")          
(include "lib/arithmetic.scm")
(include "lib/string.scm")
(include "lib/io.scm")
(include "lib/vector.scm")

;(include "utils/x86-jit.scm")

;(include "read.scm")
;(include "utils/pattern-matching.scm")
;(include "utils/stack-env.scm")
;(include "expand.scm")
;(include "stackvm.scm")
;(include "register_ir.scm")
;(include "runtime.scm")

(%compiler-init-flag)