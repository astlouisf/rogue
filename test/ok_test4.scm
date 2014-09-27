(let ((x 1))
  (if (= x 1)
      (let ((x 2))
        (if (< 1 x)
            (if (< x 2)
                (print -1) 
                (print 1)))))) ;;@ 1
