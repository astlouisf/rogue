
(define s "12345678")
(define d 0)


(define (loop i)
  ;; it should get to 30, further makes it get a stack over flow
  ;; (probably because of lack of tail call recursion)
  (if (< i 30)
      (begin
        (set! s (string-append s d))
        (loop (+ 1 i)))))

(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! s (string-append s s))
(set! d s)

(loop 0)
(print (string-length s)) ;;@ 63488