
(define (with-input-from-process process f)
  (let ((p (open-pipe process)))
    (f p)))

(define (open-pipe command)
  (let ((rvalue 0))
    (%call-extern-c-function "io_popen" command)
    rvalue))

(define (c_test2)
  (let ((x 2)
        (y 4))
    (%call-extern-c-function "c_test")))

(define (open-input-file filename)
  (let ((rvalue 0))
    (%call-extern-c-function "io_open_input_file" filename)
    rvalue))

(define (open-output-file filename)
  (let ((rvalue 0))
    (%call-extern-c-function "io_open_output_file" filename)
    rvalue))

(define (close-output-port file)
  (%call-extern-c-function "io_close_file" file))

(define (read-char file)
  (let ((rvalue 0))
    (%call-extern-c-function "io_read_char" file)
    (if (> rvalue 0)
        (integer->char rvalue)
        #!eof)))

(define (peek-char file)
  (let ((rvalue 0))
    (%call-extern-c-function "io_peek_char" file)
    (if (> rvalue 0)
        (integer->char rvalue)
        #!eof)))

(define (%write-char c file)
  (let ((c (char->integer c)))
    (%call-extern-c-function "io_write_char" file)))

(define (write-string s file)
  (let* ((len (string-length s))
         (loop 
          (lambda (f i)
           (if (< i len)
               (begin (%write-char (string-ref s i) file)
                      (f f (+ 1 i)))))))
    (loop loop 0)))

(define (read-line file)
  (let
      ((rd (lambda (rd)
             (let ((c (read-char file)))
               (if (or (eof-object? c)
                       (char=? c #\newline))
                   '()
                   (cons c (rd rd)))))))
    (apply string (rd rd))))
                   
    
(define (shell-command cmd)
  (open-pipe cmd))


(define %command-line-list 0)
(define (command-line)
  (if (eq? 0 %command-line-list)
      (begin
        (let ((argc 0))
          (%call-extern-c-function "io_get_argc")
          (let ((args 
                 (map (lambda (i)
                        (let ((len 0)
                              (j i))
                          (%call-extern-c-function "io_get_argvi_len")
                          (%object-new type-uid-string (%word-ceil (+ 1 len)))))
                      (listrange 0 argc))))
            (%call-extern-c-function "io_fill_argv")
            (set! %command-line-list args)
            args)))
      %command-line-list))
