;; should print 48 14
(print (let ((x 2) (y 4)) (let ((x (+ y x)) (y (* y x))) (* x y)))) ;;@ 48
(let ((x 2) (y 4)) (let ((x (+ y x)) (y (* y x))) (print (+ x y)))) ;;@ 14
