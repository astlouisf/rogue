;; Test each op

(let ((x (+ 6 6))
      (y 34)
      (peutetre #t)
      (jamais (< 4 3))
      (toujours (= 90 (* 9 10))))
     (if toujours
         (if peutetre
             (if jamais
                 (quotient 1 0)
                 (let ((x (modulo y x)) 
                       (y (quotient y x))) 
                     (print  (- x y)))) ;;@ 8
             )
         (print 2)))
