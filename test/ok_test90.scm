;;
;; Test lexical scoping
;; Expected: 3 printed
;;

(let ((let 3))
     (print let)) ;;@ 3
