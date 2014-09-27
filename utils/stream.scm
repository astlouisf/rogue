;; Contains function related to the manipulation of streams.

;; Return both peek and read function for a character stream made from a string.
;; The read and peek function are respectively in car and cdr of the returned
;; pair.
(define (make-string-stream str) 
   (let* ((position 0)
          (peek (lambda () (if (< position (string-length str))
                               (string-ref str position)
                               #!eof)))
          (read (lambda () (let ((char-found (peek)))
                                (begin
                                   (if (not (eof-object? char-found))
                                       (set! position (+ 1 position)))
                                   char-found)))))
        
         (list read peek)))

