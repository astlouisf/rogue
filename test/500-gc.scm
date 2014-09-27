
(let ((x 3)
      (y (cons 1 2))
      (p (string->symbol (string-append "foo" "bar"))))
  (let ((z (cons x 
                 (let ((qwe (cons 42 43))
                       (asd (cons 100 101))
                       (bar 'bar))
                   (print asd) ;;@ (100 . 101)
                   (cons qwe (cons y bar)))))
        (f (lambda () p)))
    (print z) ;;@ (3 (42 . 43) (1 . 2) . bar)
    (print p) ;;@ foobar
    (%gc-routine)
    (print z) ;;@ (3 (42 . 43) (1 . 2) . bar)
    (print (f)) ;;@ foobar
    ))
(%gc-routine)
