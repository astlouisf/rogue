;;(include "utils/pattern-matching.scm")
(define (peephole code)
  (define (peep-optimise acc code)
   (match code


;;    ((('acc x) ('push 'acc) . rest)
;;     (peep-optimise acc (cons `(push ,x) rest)))

;;    ((('acc x) ('push 'acc) ('acc y) . rest)
;;     (peep-optimise acc (cons `(push ,x) (cons `(acc ,y)  rest))))

;;    ((('jump x) (instr _) . rest) where (not (eq? instr 'label))
;;     (peep-optimise acc (cons `(jump ,x) rest)))

    ((('acc _) ('acc x) . rest)
     (peep-optimise acc (cons `(acc ,x) rest)))

    ((('restore-state) ('save-state) . rest)
     (peep-optimise acc rest))

    ((('pop 0) . rest)
     (peep-optimise acc rest))

    ((('pop) ('pop) . rest)
     (peep-optimise acc (cons `(pop ,2) rest)))

    ((('pop) ('pop x) . rest)
     (peep-optimise acc (cons `(pop ,(+ x 1)) rest)))

    ((('pop x) ('pop) . rest)
     (peep-optimise acc (cons `(pop ,(+ x 1)) rest)))

    ((('pop x) ('pop y) . rest)
     (peep-optimise acc (cons `(pop ,(+ x y)) rest)))

    (() acc);;x where (null? x) acc)
    ((instr . rest)
     (peep-optimise (cons instr acc) rest))
    (_ (error "peephole"))))
;;  (trace peep-optimise)
  (reverse (peep-optimise '() code)))

(peephole '((add) (pop) (pop) (call qwf)))
