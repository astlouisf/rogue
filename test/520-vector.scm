
(define v (make-vector 4 "foo"))
(vector-set! v 1 'bar)
(vector-set! v 2 (string-append (vector-ref v 0)
                                "bar"))
(vector-set! v 3 128)
(print v) ;;@ #("foo" bar "foobar" 128)
(print (vector-length v)) ;;@ 4
(print (list->vector (listrange 0 5))) ;;@ #(0 1 2 3 4)
(print (vector 0 1 2 3 4 5)) ;;@ #(0 1 2 3 4 5)