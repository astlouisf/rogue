

(define x #\A)
(define q '())
(define z "01234")
(print (string? z)) ;;@ #t
(print (%object? z)) ;;@ #t
(print (null? q)) ;;@ #t
(print (null? "nil")) ;;@ #f
(print (null? 0)) ;;@ #f
(print (char->integer #\A)) ;;@ 65
(write-char x)
(write-char #\b)
(write-char #\C)
(write-char #\d)
(newline) ;;@ AbCd
(string-set! z 2 #\Z)
(write-char (string-ref z 2))
(newline) ;;@ Z
(print z) ;;@ 01Z34
(print "Hello!") ;;@ Hello!
