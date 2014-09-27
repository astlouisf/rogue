
(print (append '(1 2 3) '(4 5 6))) ;;@ (1 2 3 4 5 6)

(define f (lambda L (append (list 'foo) L L)))
(print (f 4 5 6)) ;;@ (foo 4 5 6 4 5 6)

(print '(.foo)) ;;@ (.foo)