

(define a 'qwerty)
(let ((b 'qwerty)
      (c 'azerty))
  (begin
    (print a) ;;@ qwerty
    (print (symbol->string a)) ;;@ qwerty
    (print (eq? b c)) ;;@ #f
    (print (eq? a b)) ;;@ #t
    (print (eq? a c)) ;;@ #f
    (print '()) ;;@ ()
    (print (cons 123 (cons 456 789))) ;;@ (123 456 . 789)
    (let ((x '()))
      (print (car (cdr (cons 123 (cons 'asd x)))))))) ;;@ asd