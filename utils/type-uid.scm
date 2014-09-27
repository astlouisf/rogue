(define (type-uid x)
  (case x
    ((procedure) 0)
    ((pair) 2)
    ((string) 42)
    ((symbol) 43)
    ((char) 44)
    ((vector) 45)
    ((closure) #x60)
    ((machine-code) #x61)))

