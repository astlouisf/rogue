
(define-type key name value)
(let ((k (make-key "Foo" 42)))
  (print (key-name k)) ;;@ Foo
  (key-value-set! k 102)
  (print (key-value k)) ;;@ 102
  (print (key? k)) ;;@ #t
  (print (key? "Pear")) ;;@ #f
  )