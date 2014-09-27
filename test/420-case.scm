
(case 'foo
  ((wonk a) (print 40))
  ((not here) (print 41))  ;;@ Victory!
  ((foo bar) (print "Victory!") (print 42)) 
  (else (print 43)))       ;;@ 42