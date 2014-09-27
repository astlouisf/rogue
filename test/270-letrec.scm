
(letrec 
    ((g (lambda (x) 
          (if (%<= x 0)
              0
              (%+ x (g (%- x 1))))))
     (f (lambda (x)
          (if (%<= x 0)
              1
              (%* x (f (%- x 1)))))))
  (%print (g 5))(%putchar 10) ;;@ 15
  (%print (f 5))(%putchar 10));;@ 120
  