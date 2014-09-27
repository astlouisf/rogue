
(%putchar (if (< 1 1) 65 66)) 
(%putchar (if (< 1 2) 65 66))
(%putchar (if (< 1 0) 65 66))
(%putchar 10) ;;@ BAB

(%putchar (if (<= 1 1) 65 66)) 
(%putchar (if (<= 1 2) 65 66))
(%putchar (if (<= 1 0) 65 66))
(%putchar 10) ;;@ AAB

(print (integer->string 142857));;@ 142857
(print (integer->string 0)) ;;@ 0
(print (integer->string -22446600)) ;;@ -22446600
