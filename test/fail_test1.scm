;;
;; Test syntaxic analysis
;; Expected: unexpected dot
;;
(let ((x (+ 4 12) . )
      (y (quotient 32 3)))
     (+ (* 2 x) y))


(let ((x (+ 10 11)))
     (let ((x (+ x 10)))
          (+ x 11)))

(+ (if (* 10 0)
       1337
       6)
   (if (+ 2 2)
       36))
