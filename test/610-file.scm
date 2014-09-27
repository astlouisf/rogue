
(let ((f (open-input-file "test/140-if.scm")))
  (let ((s (read-line f)))
    (print s) ;;@ (define x #f)
    (print (string-equal? s "(define x #f)")))) ;;@ #t
 