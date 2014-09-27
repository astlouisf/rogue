;(include "utils/type-uid.scm")



(define (string-join str L)
  (if (null? L)
      ""
      (if (null? (cdr L))
          (car L)
          (string-append (car L) str (string-join str (cdr L))))))
                  
(define word-size 8)


(define (stack-to-x86 instruction-list)
  (append
   runtime-head
   (stack-to-x86_ instruction-list '())))

(define (append-rev xs ys)  
  (if (null? xs)
       ys
       (append-rev (cdr xs) (cons (car xs) ys))))


(define (stack-to-x86_ instruction-list machine-code)
  (if (null? instruction-list)
      (reverse machine-code)
      (let ((X (stack-instr-to-x86 (car instruction-list))))
        (stack-to-x86_ (cdr instruction-list)
                       (append-rev X
                                   machine-code)))))


(define (gen-value value)
   (cond
      ((number? value) (* value 4))
      ((boolean? value) (if value 7 3)) ;; #b111 #b011
      ((or  ;; '()
        (and (pair? value) (eq? 'quote (car value)))
        (null? value) ) #b1011)
      ((eq? value 'magic-stack-value)
       #b11011)
      ((eq? value #!eof)
       #b10011)
      (else (write value) (error " <- Dont know how to encode"))
      ))


; $: immediate
; %: register
; &: indirect
; _: address
(define (stack-instr-to-x86 instruction)
  (let ((x
   (let ((instruction-name (car instruction)))
     (cond
       ((eq? instruction-name 'acc)
        `((mov ($ . ,(gen-value (cadr instruction))) (% . accumulator))))
       ((eq? instruction-name 'load-from-offset )
        `((mov (& ,(cadr instruction) (% . rax)) (% . rax))))
       ((eq? instruction-name 'store-at-offset )
        `((push (% . rcx))
          (mov (& 8 (% . rsp)) (% . rcx))
          (mov (% . rax) (& ,(cadr instruction) (% . rcx)))
          (pop (% . rcx))))
       ((eq? instruction-name 'push)
        `((push (% . accumulator))))
       ((eq? instruction-name 'pop)
        (if (= (length instruction) 2)
            `((add ($ . ,(* (cadr instruction) word-size)) (% . stack-pointer)))
            `((add ($ . ,word-size) (% . stack-pointer)))))
       ((eq? instruction-name 'load)
        `((mov (& ,(* word-size (- (cadr instruction) 1)) (% . stack-pointer))
               (% . accumulator))))
       ((eq? instruction-name 'store-local)
        `((mov (% . accumulator)
               (& ,(* word-size (- (cadr instruction) 1)) (% . stack-pointer)))))
       ((eq? instruction-name 'add)
        `((add (& ,0 (% . stack-pointer)) (% . accumulator))))
       ((eq? instruction-name 'sub)
        `((mov (% . accumulator) (% . temp))
          (mov (& ,0 (% . stack-pointer)) (% . accumulator))
          (sub (% . temp) (% . accumulator))
          (shr ($ . ,2) (% . accumulator))      ;; for negative numbers
          (shl ($ . ,2) (% . accumulator))))
       ((eq? instruction-name 'quotient)
        `((mov (% . accumulator) (% . temp))
          (mov (& ,0 (% . stack-pointer)) (% . accumulator))
          (shr ($ . ,2) (% . accumulator))
          (shr ($ . ,2) (% . temp))
          (xor (% . rdx) (% . rdx))
          (idiv (% . temp))
          (shl ($ . ,2) (% . accumulator))))

       ((eq? instruction-name 'mul)
        `((shr ($ . ,2) (% . accumulator))
          (imul (& ,0 (% . stack-pointer)) (% . accumulator))))

       ((eq? instruction-name 'mod)
        `((mov (% . accumulator) (% . temp))
          (mov (& ,0 (% . stack-pointer)) (% . accumulator))
          (shr ($ . ,2) (% . accumulator))
          (shr ($ . ,2) (% . temp))
          (xor (% . rdx) (% . rdx))

          ;(push (% . rax))
          ;(mov (% . temp) (% . rax))
          ;(call (_ . print))
          ;(pop (% . rax))
          ;(call (_ . print))

          (idiv (% . temp))
          (mov (% . rdx) (% . accumulator))
          (shl ($ . ,2) (% . accumulator))))

       ((eq? instruction-name 'equal)
         (let ((true-jmp (gensym))
               (end-jmp  (gensym)))
        `((cmp (& ,0 (% . stack-pointer)) (% . accumulator))
          (je (_ . ,true-jmp))
          (mov ($ . ,(gen-value #f)) (% . accumulator))
          (jmp (_ . ,end-jmp))
          (label ,true-jmp)
          (mov ($ . ,(gen-value #t)) (% . accumulator))
          (label ,end-jmp))))

       ((eq? instruction-name 'less)
        (let ((true-jmp (gensym))
              (end-jmp  (gensym)))
        `((cmp (& ,0 (% . stack-pointer)) (% . accumulator))
          (jg  (_ . ,true-jmp)) ;; the arguments are inverted thus the jg instead of jl
          (mov ($ . ,(gen-value #f)) (% . accumulator))
          (jmp (_ . ,end-jmp))
          (label ,true-jmp)
          (mov ($ . ,(gen-value #t)) (% . accumulator))
          (label ,end-jmp))))

       ((eq? instruction-name 'lesseq)
        (let ((true-jmp (gensym))
              (end-jmp  (gensym)))
        `((cmp (& ,0 (% . stack-pointer)) (% . accumulator))
          (jge  (_ . ,true-jmp)) ;; same here for jge
          (mov ($ . ,(gen-value #f)) (% . accumulator))
          (jmp (_ . ,end-jmp))
          (label ,true-jmp)
          (mov ($ . ,(gen-value #t)) (% . accumulator))
          (label ,end-jmp))))


       ((eq? instruction-name 'std)
        
        `(,@(if (= (length instruction) 3)
                `((mov ($ . ,(caddr instruction)) (% . rcx)))
                '())
          (call (_ . ,(string->symbol 
                       (string-append "_std_" 
                                      (symbol->string 
                                       (cadr instruction))))))))
       
        

       ((eq? instruction-name 'label) (list instruction))
       ((eq? instruction-name 'jump)
        `((jmp (_ . ,(cadr instruction)))))
       ((eq? instruction-name 'jump-false)
        `((cmp ($ . ,(gen-value #f)) (% . accumulator))
          (je (_ . ,(cadr instruction)))))

       ((eq? instruction-name 'return)
        (let ((elsel (gensym)))
        `(;; for functions with a rest parameter, we might have pushed an empty list
          ;; on the stack. It's indicated by negating the return address
          (pop (% . r9))
          (cmp ($ . 0) (% . r9))
          (jge (_ . ,elsel))
          ;; if the RA is <0, then we must pop the empty list
          ;; and negate again the RA so it comes back to normal
          (add ($ . 8) (% . rsp))
          (neg (% . r9))
          (label ,elsel)
          (push (% . r9)) ;; push the RA back on the stack
          (ret))))
       ((eq? instruction-name 'load-address-of)
        (if (= (length instruction) 2)
            `((lea (& (_ . ,(cadr instruction)) (% . rip)) (% . rax)))
            (if (= (length instruction) 3)
                `((lea (& (_ . ,(cadr instruction)) (% . rip)) (% . rax))
                  (add ($ . ,(caddr instruction)) (% . rax)))
                (begin (display instruction) (error " :: Unknown load-address-of instr")))))
       ((eq? instruction-name 'call)
        `((mov ($ . ,(cadr instruction)) (% . rcx)) ;; number of arguments passed
          (mov (% . accumulator) (% . this))        ;; reference to the closure object
          (mov (& -1 (% . accumulator)) (% . rax))  ;; the address of the lambda-decl
          (call (* (% . rax)))))
       ((eq? instruction-name 'procedure-header)
        (gen-procedure-header (cadr instruction) (caddr instruction)))
       ((eq? instruction-name '.data)
        `((dot data)
          (dotc globl globals_head globals_tail ,@runtime-globals)))
       ((eq? instruction-name 'string-litt)
        (let* ((slen (+ 1 (string-length (cadr instruction))))
               (tlen (+ slen (- 8 (modulo slen 8)))))
          `((dot align 8)
            (dot quad ,tlen)
            (dot quad ,(type-uid 'string))
            (label ,(caddr instruction))
            (dot ascii ,(string-append 
                         (cadr instruction) 
                         (apply 
                          string-append (map (lambda (x) "\0")
                                             (range -1 (- 8 (modulo slen 8))))))))))
       ((eq? instruction-name 'symbol-litt)
        (let* ((slen (+ 1 (string-length (cadr instruction))))
               (tlen (+ slen (- 8 (modulo slen 8)))))
          `((dot align 8)
            (dot quad ,tlen)
            (dot quad ,(type-uid 'symbol))
            (label ,(caddr instruction))
            (dot ascii ,(string-append 
                         (cadr instruction) 
                         (apply 
                          string-append (map (lambda (x) "\0")
                                             (range -1 (- 8 (modulo slen 8))))))))))
       ((eq? instruction-name 'global)
        `((label ,(cadr instruction))
          (dot quad 0)))
       ((eq? instruction-name 'call-extern-c-function)
        
        `((push (% . rdi))
          (mov (% . rsp) (% . rdi))   ;; remember original stack-pointer
          (and ($ . -16) (% . rsp))   ;; align stack-pointer to multiple of 16
          (sub ($ . 8)   (% . rsp))   ;; pad stack
          (push (% . rdi))            ;; save original stack-pointer
          (add ($ . 8) (% . rdi))     ;; skip %rdi which was just pushed
          ;; call C function passed as instruction parameter
          ;; with %rsp as sole argument (contained in rdi)
          (call (_ . ,(string->symbol (cadr instruction))))
          (pop  (% . rsp))            ;; restore original stack-pointer
          (pop (% . rdi))
          ))

       ((eq? instruction-name 'store-global)
        `((mov (% . rax) (_ . ,(cadr instruction)))))
       ((eq? instruction-name 'load-global)
        `((mov (_ . ,(cadr instruction)) (% . rax))))
       ((eq? instruction-name 'load-free)
        `((mov (& ,(+ 7 (* 8 (cadr instruction))) (% . this)) (% . accumulator))))

       ((eq? instruction-name 'save-state)
        `((push (% . this))))
       ((eq? instruction-name 'restore-state)
        `((pop (% . this))))

       ((eq? instruction-name 'gc-align)
        (append
         `((dot align 8)
           (dot quad ,(caddr instruction)))
         (case (cadr instruction)
           ((0) '())
           ((1) '((dot byte 0)))
           ((2) '((dot word 0)))
           ((3) '((dot byte 0) (dot word 0))))))
       (else 
        (error_ "Unknown stack instruction:" instruction)
        '(()))))))
    (if verbose (print x))
    x))

(define (gen-procedure-header nargs hasrest)
  (if hasrest
      (let ((loopl (gensym 'loop))
            (loopend (gensym 'end))
            (loopdisp (gensym 'loop))
            (loopdispend (gensym 'end))
            (dolist (gensym 'dolist))
            (fstart (gensym 'fstart)))
        `((push ($ . ,(* -4 (- nargs 1))))
          (cmp ($ . ,(- nargs 1)) (% . rcx)) ;; if there are nargs-1 arguments, the rest
          ;; parameter is the empty list 
          ;; if there are any less, we do not have enough arguments, raise an error!
          (jl (_ . _std_%error_nargs))
          (add ($ . 8) (% . rsp))
          (sub ($ . ,(- nargs 1)) (% . rcx))
          ;; if there are no rest parameters, we need to push the empty list
          ;; on the stack (and pop it later on!)
          (cmp ($ . 0) (% . rcx))
          (jne (_ . ,dolist))
          (pop (% . rax)) ;; pop the RA
          (push ($ . ,(gen-value '())))
          (neg (% . rax)) ;; negate the RA to indicate that the empty list was pushed
          (push (% . rax))
          (jmp (_ . ,fstart))
          ;; else we will generate a list for the rest
          ;; arguments
          (label ,dolist)
          (push (% . rdi)) ;; temp count register
          (push (% . rax)) ;; temp register that will contain the list
          (push (% . r8))  ;; temp register that will contain the car
          ;;(xor (% . rdi) (% . rdi))
          (mov ($ . 0) (% . rdi))
          (mov ($ . ,(gen-value '())) (% . rax)) ;; empty list to start with
          (label ,loopl)
          (cmp (% . rdi) (% . rcx))
          (je (_ . ,loopend))
          (mov (& 32 (% . rsp) (% . rdi) 8) (% . r8))
          (push (% . rdi))
          (push (% . r8))
          (call (_ . _std_%cons)) ;; new pair now in rax
          (add ($ . 8) (% . rsp)) ;; pop
          (pop (% . rdi))
          (inc (% . rdi))
          (jmp (_ . ,loopl))
          (label ,loopend)
          ;; here we need to displace the actual arguments
          ;; so that (foo A B C D) appears to be (foo A '(B C D)), that is,
          ;; the stack goes from (A B C D) to (_ _ A '(B C D)), _ denotes junk.
          ;; move the list first on top
          (mov (% . rax) (& 32 (% . rsp)))
          (mov ($ . ,(- nargs 1)) (% . rdi))
          (mov (% . rcx) (% . r8))
          (label ,loopdisp)
          (cmp ($ . 0) (% . rdi))
          (je (_ . ,loopdispend))
          (mov (& 32 (% . rsp) (% . r8) 8) (% . rax))
          (mov (% . rax) (& 32 (% . rsp) (% . rdi) 8))
          (dec (% . r8))
          (dec (% . rdi))
          (jmp (_ . ,loopdisp))
          (label ,loopdispend)
          (pop (% . r8))
          (pop (% . rax))
          (pop (% . rdi))
          (label ,fstart)
          ))

          ;; Then we need to pop the stacked rest arguments
          ;; and push the list (and the return address too).
          ;; We will start by moving the list into the "last" 
          ;; argument's position
          ;;(mov (% . rcx) (% . rdi))
      `((cmp ($ . ,nargs) (% . rcx))
        (push ($ . ,(* 4 nargs)))
        (jne (_ . _std_%error_nargs))
        (add ($ . 8) (% . rsp)))))

(define (gen-x86-register register)
   (cond
      ((eq? 'accumulator register) "rax")
      ((eq? 'stack-pointer register) "rsp")
      ((eq? 'temp register) "rcx")
      ((eq? 'this register) "rdi")
      (else (symbol->string register))))


(define (gen-x86-value value)
   (cond
      ((number? value) (number->string value))
      ((boolean? value) (number->string (if value (gen-value #t) (gen-value #f))))
      ((char? value) (number->string 0))
      ((symbol? value) (x86-symbol->string value))
      ((null? value) (gen-value '()))
      (else (string-append "error don't know how to write/gen-value" (write value)))))

(define (gen-address address)
  (if (pair? address)
   (let ((type (car address)))
    (cond
     ((eq? '% type)
      (string-append "%" (gen-x86-register (cdr address))))
     ((eq? '$ type)
      (string-append "$" (gen-x86-value (cdr address))))
     ((eq? '_ type)
      (string-append (gen-x86-value (cdr address))))
     ((eq? '& type)
      (string-append (gen-address (cadr address))
                     "("
                     (string-join ","
                                  (map gen-address (cddr address)))
                     ")"))
     ((eq? '* type)
      (string-append "*"
                     (gen-address (cadr address))))
     
     (else (error (string-append "Unknown address:" (string address))))))
   (gen-x86-value address)))


(define (x86-assembly-header writer)
  (writer "    .globl main\n")
  (writer "    .text\n")
  (writer "main:\n"))

(define (x86-assembly-footer writer)
  (writer "    \n"))


(define (x86->assembly instructions writer)
  (if (not (null? instructions))
      (begin
        (writer (x86-instruction->assembly (car instructions)))
        (x86->assembly (cdr instructions) writer))))



(define (x86-instruction->assembly instruction)
  (if (null? instruction)
      ""
  (begin
    (string-append
     (cond
      ((eq? (car instruction) 'label)
       (string-append (x86-symbol->string (cadr instruction))
                      ":"))
      ((eq? 'dot (car instruction))
       (string-append "    ." (x86-symbol->string (cadr instruction)) " "
                      (string-join " " (map x-to-string (cddr instruction)))))
      ((eq? 'dotc (car instruction))
       (string-append "    ." (x86-symbol->string (cadr instruction)) " "
                      (string-join ", " (map x-to-string (cddr instruction)))))
      ((= (length instruction) 3)
       (gen-binary-x86 instruction))
      ((= (length instruction) 2)
       (gen-unary-x86 instruction))
      ((= (length instruction) 1)
       (gen-noarg-x86 instruction))
      (else (error 
             (string-append "Unknown symbol: "
                            (symbol->string (car instruction))
                            "\n"))))
     "\n"))))


(define (gen-binary-x86 instruction)
   (string-append (gen-unary-x86 instruction)
                  ", "
                  (gen-address (caddr instruction))))

(define (gen-unary-x86 instruction)
   (string-append "    "
                 (x86-symbol->string (car instruction))
                  " "
                  (gen-address (cadr instruction))))

(define (gen-noarg-x86 instruction)
   (string-append "    " (x86-symbol->string (car instruction))))



(define (x-to-string x)
  (cond
   ((string? x) (string-append "\"" x "\""));;(with-output-to-string '() (lambda () (write x))))
   ((number? x) (number->string x))
   ((symbol? x) (x86-symbol->string x))
   (else (display x) (error " unencodable in x-to-string"))))

(define (x86-symbol->string s)
  (letrec ((ss (symbol->string s))
           (replace
            (lambda (S i L)
              (if (< i L)
                  (string-append 
                   (case (string-ref S i)
                     ((#\%) "_p_")
                     ((#\?) "_qm_")
                     ((#\!) "_em_")
                     ((#\>) "_gt_")
                     ((#\<) "_lt_")
                     ((#\-) "_d_")
                     ((#\+) "_plus_")
                     ((#\*) "_star_")
                     ((#\=) "_eq_")
                     ((#\#) "_ds_")
                     (else 
                      (string (string-ref S i))))
                   (replace S (+ 1 i) L))
                  ""))))
    (replace ss 0 (string-length ss))))
                  
    
