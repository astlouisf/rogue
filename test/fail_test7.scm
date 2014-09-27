;;
;; Test syntaxic analysis
;; Expected: duplicated bindings
;;

(let ((x 3)
      (x 4))
     x)
