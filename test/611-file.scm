

(let ((f (open-output-file "test/temp.txt")))
  (display "This is a test!\nAbracadabra!" f)
  (close-output-port f))

(let ((f (open-input-file "test/temp.txt")))
  (print (read-line f)) ;;@ This is a test!
  (print (string-equal? (read-line f)
                        "Abracadabra!")) ;;@ #t
  (close-output-port f))

(shell-command "rm test/temp.txt")