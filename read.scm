(include "utils/error.scm")


(define (read-whole-file filename)
  (let* ((file-input (open-input-file filename))
         (code '()))
    (define (read-loop)
      (let ((ast (parse file-input filename)))
        (if (not (eof-object? ast))
            (begin
              (set! code (append code (list ast)))
              (read-loop)))))
    (read-loop)
    code))


(define (parse input-stream file-name)
  (let ((result  (read-from-input-stream input-stream file-name)))
    result))


(define (read-expression)
  (let ((lineno 0)
        (column 0)
        (curline ""))
    ;;(display "reading!\n")
    (let ((x
    (read-stream (lambda () (let ((c (read-char)))
                              (if (or (eq? c #\newline) (eq? c #!eof))
                                  (begin (set! lineno (+ 1 lineno))
                                         (set! column 0)
                                         (set! curline ""))
                                  (begin (set! column (+ 1 column))
                                         (set! curline (string-append curline 
                                                                      (string c)))))
                              c))
                 (lambda () (let ((x (peek-char)))
                                        ;(write-char x)
                              x))
                 (lambda () (list lineno column curline))
                 "default")))
      ;;(display "read!\n")
      x)))

;; read s-expr from an input stream and analyse it 
;; as a valid program before returning it
(define (read-from-input-stream input-stream file-name)
  (let ((lineno 0)
        (column 0)
        (curline ""))
    ;;(display "reading!\n")
    (let ((x
          (read-stream (lambda () (let ((c (read-char input-stream)))
                                    (if (or (eq? c #\newline) (eq? c #!eof))
                                     (begin (set! lineno (+ 1 lineno))
                                            (set! column 0)
                                            (set! curline ""))
                                     (begin (set! column (+ 1 column))
                                            (set! curline (string-append
                                                           curline
                                                           (string c)))))
                                    c))
                       (lambda () (let ((x (peek-char input-stream)))
                        ;;(display "peek-stream ")(display x)
                        ;;(display" pos: ")(display lineno)
                        ;;(display ",")(display column)(display "\n")
                        ;(write-char x)
                                     x))
                       (lambda () (list lineno column curline))
                       file-name)))
      ;;(display "read!\n")
      x)))

;; Generalised stream reader
(define (read-stream read-stream-char peek-stream-char get-cur-pos file-name)
  (define (error_ msg)
     (compilation-error "Syntax" msg file-name (get-cur-pos) '() 70))

  (define (read-stream_)
    (match (read-stream-non-whitespace) as c
     (_ where (eof-object? c) c)
     (#\; ;;(display "read comment.\n")
          (read-comment))
     (#\( ;;(display "read list.\n")
          (read-list))
     (#\" ;;(display "read string.\n")
          (apply string (read-string #f)))
     (#\' ;;(display "read quote.\n")
          (list 'quote (read-stream_)))
     (#\` ;;(display "read quasiquote.\n")
          (list 'quasiquote (read-stream_)))
     (#\, ;;(display "read unquote.\n")
          (read-unquote))
     (#\# (read-hash))                       ;; Handle characters & bool
     (#\) (error_ "Unexpected closing parenthesis."))
     (_   (let ((s (apply string (cons c (read-symbol)))))
            (or (string->number s)
                (let ((sym (string->symbol s)))
                  (if (equal? s ".")
                      (error_ "Unexpeceted dot .")
                      sym)))))))


  (define (flush-while guard)
    (let ((c (peek-stream-char)))
      (if (not (guard c))
          (begin (read-stream-char) (flush-while guard)))))


  (define (read-while guard acc)
    (let ((c (peek-stream-char)))
      (if (guard c)
          acc
          (read-while guard
                      (string-append acc (string (read-stream-char)))))))




  (define (eval-hex-string s acc)
    ;;(display "string:\n")
    ;;(display s)(newline)
    (if (= 0 (string-length s))
        acc
        (eval-hex-string
         (substring s 1 (string-length s))
         (+ (* 16 acc) 
            (let ((c (string-ref s 0)))
              (cond 
               ((and (char>=? c #\0)
                     (char<=? c #\9))
                (- (char->integer c) (char->integer #\0)))
               ((and (char>=? c #\A)
                     (char<=? c #\F))
                (+ 10 (- (char->integer c) (char->integer #\A))))
               ((and (char>=? c #\a)
                     (char<=? c #\f))
                (+ 10 (- (char->integer c) (char->integer #\a))))
               (else
                (error_ "Unexpected character in hex"))))))))


  (define (read-comment)
    (read-while (lambda (x) (or (eof-object? x)
                                 (char=? x #\newline)))
                "")
    (read-stream_))

  (define (read-unquote)
    (let ((splice-char (peek-stream-non-whitespace)))
      (if (eq? splice-char #\@)
          (begin (read-stream-char)
                 (list 'unquote-splicing (read-stream_)))
          (list 'unquote (read-stream_)))))


  (define (read-hash)
    (let ((dostop (lambda (c) (or (eof-object? c)
                                  (char<=? c #\space)
                                  (char=? c #\))
                                  (char=? c #\()
                                  (char=? c #\;)))))
      (match (read-stream-char) as c
       (#\t where (delimiter? (peek-stream-char)) #t)
       (#\f where (delimiter? (peek-stream-char)) #f)
       (#\\ (let ((d (read-while dostop (string (read-stream-char)))))
              (if (= 1 (string-length d)) ;; not here!
                  (string-ref d 0)
                  (cond ((equal? d "space") #\space)
                        ((equal? d "newline") #\newline)
                        (else (list 'error d))))))
       (#\! (let ((d (read-while dostop (string (read-stream-char)))))
              (cond ((equal? d "eof") #!eof)
                    (else (list 'error d)))))
       (#\b (let ((f (lambda (f acc)
                       (let ((c (peek-stream-char)))
                         (if (not (or (char=? c #\0)
                                      (char=? c #\1)))
                             acc
                             (begin 
                               (read-stream-char)
                               (f f (+ (* 2 acc)
                                       (if (char=? c #\0) 0 1)))))))))
              (f f 0)))
       (#\x (let ((d (read-while dostop (string (read-stream-char)))))
              (eval-hex-string d 0)))
       (_   (error_ "Datum or EOF expected? (reading #)")))))

  (define (read-string last-escaped)
    (match (read-stream-char) as c
     (_ where (eof-object? c)
          (error_ "Missing closing double quotes."))
     (#\" where (not last-escaped) '())
     (#\\ (cons c (read-string #t)))
     (_   (cons c (read-string #f)))))


  (define (read-list)
    (match (peek-stream-non-whitespace) as c
     (_   where (eof-object? c)
          (read-stream-char)
          (error_ "Missing closing parenthesis."))
     (#\) (read-stream-char) '())
     (#\. where (char=? (begin (read-stream-char)
                               (peek-stream-char))
                        #\space)
          (let* ((rest (read-stream_))
                 (end (read-stream-non-whitespace)))
            (if (char=? end #\))
                rest
                (error_ "Improperly placed dot"))))
     (#\. (let* ((x (string->symbol (apply string
                                           (cons #\. (read-symbol)))))
                 (xs (read-list)))
            (cons x xs)))
     (_   (let* ((x  (read-stream_))
                 (xs (read-list)))
            (cons x xs)))))


  (define (read-symbol)
    (let ((c (peek-stream-char)))
      (if (or (eof-object? c)
              (delimiter? c))
          '()
          (begin
            (read-stream-char)
            (cons c (read-symbol))))))

  (define (delimiter? c)
    (or (char=? c #\()
        (char=? c #\))
        (char=? c #\')
        (char=? c #\")
        (char=? c #\;)
        (char<=? c #\space)))


  (define (read-stream-non-whitespace)
    (begin (peek-stream-non-whitespace)
           (read-stream-char)))


  (define (peek-stream-non-whitespace)
    (let ((c (peek-stream-char)))
      (if (and (not (eof-object? c))
               (char=? c #\;)) ;; skip comments
          (begin
            (read-while (lambda (x) (or (eof-object? x) 
                                        (char=? x #\newline)))
                        "")
            (peek-stream-non-whitespace))
          (if (or (eof-object? c)
                  (not (char<=? c #\space)))
              c
              (begin
                (read-stream-char)
                (peek-stream-non-whitespace))))))


  ;;(trace read-stream_)
  ;;(trace read-unquote)
  ;;(trace read-list)
  ;;(trace read-comment)
  ;;(trace read-string)
  ;;(trace read-hash)

  (read-stream_))
