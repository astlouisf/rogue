(define (error_ message ast)
  (display "*** ")
  (display message)
  (newline)
  (pretty-print ast)
  (newline)
  (exit 1))

(define (repeat fn time)
  (if (> time 0)
      (begin
       (fn)
       (repeat fn (- time 1)))))

(define (compilation-error type message location position line errcode)
  (display "*** ")
  (display type)
  (display " error in ")
  (display location)
  (display " at ")
  (display (car position))
  (display ".")
  (display (cadr position))
  (display " : ")
  (display message)
  (display "\n")

  (display "read:\n")
  (display (caddr position))
  (display "\n")
  (repeat (lambda () (display "-")) (- (cadr position) 1))
  (display "^")
  (display "--\n")

  (display "ast:\n")
  (display line)
  (display "\n")
  (exit errcode))