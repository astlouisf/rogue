
(define foo 
  (lambda (bar . baz)
    (%putchar bar)
    (if (%= baz '())
        (%putchar 10)
        (%apply-closure foo baz))))

(foo 65 66 67 68 69) ;;@ ABCDE
(foo 65 66 67 68);;@ ABCD
(foo 65 66 67);;@ ABC
(foo 65 66);;@ AB
(foo 65);;@ A