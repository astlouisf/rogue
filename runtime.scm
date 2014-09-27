(include "utils/type-uid.scm")


(define enc#f 3) ; #b011
(define enc#t 7) ; #b111

(define (runtime-env os use-stdlib)
  (append '((label _std_%print))        print-x86
          '((label _std_%putchar))      %putchar-code
          '((label _std_%putchar_rax))  (putchar-code os)
          '((label _std_%getchar))      (getchar-code os)
          '((label getchar1))           (getchar1-code os)
          '((label _std_%exit))         %exit-code

          '((label mmap_alloc))         (mmap_alloc-code os)
          '((label _std_%gc-routine))    %gc-routine-code

          '((label _std_%pair?))        %pair?-code
          '((label _std_%cons))         %cons-code

          '((label _std_%object?))      %object?-code 
          '((label _std_%object-new))   %object-new-code
          '((label _std_%object-getraw))  %object-getraw-code
          '((label _std_%object-setraw))  %object-setraw-code
          '((label _std_%object-getq))  %object-getq-code
          '((label _std_%object-setq))  %object-setq-code
          '((label _std_%object-getb))  %object-getb-code
          '((label _std_%object-setb))  %object-setb-code
          '((label _std_%object-eqv?))  %object-eqv?-code
          '((label _std_%object-eqz?))  %object-eqz?-code
          '((label _std_%object-type))  %object-type-code
          '((label _std_%object-length)) %object-length-code
          '((label _std_%object-address)) %object-address-code

          '((label _std_%number?))      %number?-code
          
          '((label _std_%apply))        %apply-code
          '((label _std_%apply-closure))        %apply-closure-code
          '((label _std_%call-machine-code)) %call-machine-code-code
          '((label _std_%error_nargs))
          (if use-stdlib 
              %error-nargs-code
              '((mov ($ . 1) (% . rbx)) (mov ($ . 1) (% . rax)) (int ($ . #x80))))

          '((label _std_%make-closure))  %make-closure-code
          ))

(define HEAP-SIZE (* 256 1024 1024))

(define runtime-globals
  '(%stack_top %stack_bottom
               %heap_start
               %heap_current
               %heap_end
               %alloc_ptr %alloc_wanted
               %allocd_pair %allocd_obj %allocd_size
               %argc
               %argv))

(define runtime-head
  ;; we're using gcc, so the first two arguments of the main function
  ;; argc and argv and in rdi and rsi
  `((mov (% . rdi) (_ . %argc))
    (mov (% . rsi) (_ . %argv))
    (push ($ . ,HEAP-SIZE)) ;; allocate heap
    (call (_ . mmap_alloc))
    (mov (% . rax) (% . rbx))
    (mov (% . rax) (_ . %heap_start))
    (mov (% . rax) (_ . %heap_current))
    (mov (% . rax) (% . rcx))
    (add ($ . ,HEAP-SIZE) (% . rcx))
    (mov (% . rcx) (_ . %heap_end))
    (mov (% . rax) (_ . %alloc_ptr))
    (mov (% . rsp) (_ . %stack_top))
    (call (_ . _roc_main))
    ;;(call (_ . _std_%gc-routine))
    (ret)
    (label _roc_main)))

(define %gc-routine-code
  '((push (% . rax))
    (mov (% . rsp) (% . rax))   ;; remember original stack-pointer
    (mov (% . rsp) (_ . %stack_bottom))
    (mov (% . rbx) (_ . %alloc_ptr))
    (mov (% . rcx) (_ . %alloc_wanted))
    (and ($ . -16) (% . rsp))   ;; align stack-pointer to multiple of 16
    (sub ($ . 8)   (% . rsp))   ;; pad stack
    (push (% . rax))            ;; save original stack-pointer
    (call (_ . _gc_routine))    ;; call C function defined in gc.c
    (pop  (% . rsp))            ;; restore original stack-pointer
    (mov (_ . %alloc_ptr) (% . rbx))
    (pop (% . rax))
    (ret)
    ))

(define %make-closure-code
  ;; the number of arguments is in rcx
  (let ((loop (gensym 'loop))
        (end  (gensym 'end)))
    `(
      ;; we're gonna call (%object-new type-uid-closure size)
      ;;mutliply rcx by 8 and encode it
      (shl ($ . 5) (% . rcx))
      (mov (% . rcx) (% . rax))
      (push (% . rcx))
      (push ($ . ,(* 4 (type-uid 'closure)))) ;; encode the type uid
      (call (_ . _std_%object-new))
      ;; the object is at rax-1
      (pop (% . rcx))
      (pop (% . rcx))
      (shr ($ . 5) (% . rcx)) ;; get the real count back
      (push (% . rdx)) ;; temp variables
      (push (% . rdi))
      (xor (% . rdi) (% . rdi))
      (label ,loop)
      (cmp ($ . 0) (% . rcx))
      (jz ,end)
      ;; progressively move what was pushed on the stacked into the
      ;; object. The first argument (first pushed) should be the
      ;; adress of the lambda used by this closure.
      (dec (% . rcx))
      (mov (& #x18 (% . rsp) (% . rdi) 8) (% . rdx)) 
      (mov (% . rdx) (& -1 (% . rax) (% . rcx) 8))
      (inc (% . rdi))
      (jmp ,loop)
      (label ,end)
      (pop (% . rdi))
      (pop (% . rdx))
      (ret))))

(define %error-nargs-code
  `(;;(mov (% . rcx) (% . rax))
    (shl ($ . 2) (% . rcx))
    (push (% . rcx))
    (mov (_ . %error_nargs) (% . rax))
    (mov ($ . 2) (% . rcx)) ;; call %error_nargs with 2 arguments
    (mov (& -1 (% . rax)) (%  . rax))
    (call (* (% . rax)))
    (pop (% . rcx))
    (ret)))

(define %call-machine-code-code
  `((dec (%  . rax))
    (call (* (% . rax)))
    (ret)))
    

(define %apply-code
  (let ((push-loop (gensym 'push-loop))
        (call (gensym 'call)))
    `(
      (push (% . r9))
      (push (% . rcx))
      (push (% . rdx))
      (xor (% . rcx) (% . rcx))
      (mov (& 32 (% . rsp)) (% . r9)) ;; r9 = fn*, rax = ArgList
      (label ,push-loop)
      (dec (% . rax))
      (mov ($ . ,(gen-value '())) (% . rdx))
      (cmp (% . rdx) (% . rax))
      (jz (_ . ,call))
      (push (& -1 (% . rax))) ;; push the car, only -1 because rax has been decremented
      (mov (& 7 (% . rax)) (% . rax)) ;; rax = (cdr rax)
      (inc (% . rcx))
      (jmp (_ . ,push-loop))
      (label ,call)
      (call (* (% . r9)))
      (imul ($ . 8) (% . rcx))
      (add (% . rcx) (% . rsp))
      (pop (% . rdx))
      (pop (% . rcx))
      (pop (% . r9))
      (ret))))

(define %apply-closure-code
  (let ((push-loop (gensym 'push-loop))
        (call (gensym 'call))
        (pop-loop (gensym 'pop-loop)))
    `(
      (push (% . rcx))
      (push ($ . ,(gen-value 'magic-stack-value)))
      (xor (% . rcx) (% . rcx))
      (mov (& 24 (% . rsp)) (% . rdi)) ;; rdi = closure*, rax = pair* ArgList 
      (label ,push-loop)
      (cmp ($ . ,(gen-value '())) (% . rax))
      (jz (_ . ,call))
      (push (& -2 (% . rax))) ;; push the car
      (mov (& 6 (% . rax)) (% . rax)) ;; rax = (cdr rax)
      (inc (% . rcx))
      (jmp (_ . ,push-loop))
      (label ,call)
      (mov (& -1 (% . rdi)) (% . rax))
      (call (* (% . rax)))
      (label ,pop-loop)
      (pop (% . rcx))
      (cmp ($ . ,(gen-value 'magic-stack-value)) (% . rcx))
      (jne (_ . ,pop-loop))
      (pop (% . rcx))
      (ret))))



;; determine if %rax is a pair
(define %pair?-code
  (let ((ret_false (gensym 'ret-false))
        (end (gensym 'end)))
    `(;; check if it's a pair pointer
      (and ($ . 3) (% . rax)) ;; 0b11 mask
      (cmp ($ . 2) (% . rax)) ;; it needs to end in b10
      (jne ,ret_false)
      ;; return true
      (mov ($ . ,enc#t) (% . rax))
      (jmp ,end)
      (label ,ret_false)
      (mov ($ . ,enc#f) (% . rax))
      (label ,end)
      (ret)
      )))

;; determine if %rax is a number
(define %number?-code
  (let ((ret_false (gensym 'ret_false))
        (end (gensym 'end)))
    `((push (% . rdx))
      (mov (% . rax) (% . rdx))
      (and ($ . 3) (% . rax)) ;; 0b11 mask
      (cmp ($ . 0) (% . rax)) ;; it needs to end in b00
      (jne ,ret_false)
      ;; return true
      (mov ($ . ,enc#t) (% . rax))
      (jmp ,end)
      (label ,ret_false)
      (mov ($ . ,enc#f) (% . rax))
      (label ,end)
      (pop (% . rdx))
      (ret)
      )))


(define %cons-code
  (let ((elsel (gensym 'else)))
    `((push (% . rcx))
      ;; check if we still have enough space
      ;; if not, perform GC
      (mov ($ . 32) (% . rcx))
      (add (% . rbx) (% . rcx))
      (sub (_ . %heap_current) (% . rcx)) ;; rcx \in [0,HEAP-SIZE]
      (cmp ($ . ,(quotient HEAP-SIZE 2)) (% . rcx))  ;; if rcx > HEAP-SIZE / 2
      (jl  (_ . ,elsel))
      (mov ($ . 32) (% . rcx))
      (call (_ . _std_%gc-routine))     ;; then GC
      (label ,elsel)
      (mov (_ . %allocd_pair) (% . rcx))
      (inc (% . rcx))
      (mov (% . rcx) (_ . %allocd_pair))
      (pop (% . rcx))
      (movq ($ . 16) (& 0 (% . rbx)))  ;; length is 16
      (movq ($ . ,(type-uid 'pair)) (& 8 (% . rbx))) ;; type is pair
      (mov (% . rax) (& 24 (% . rbx))) ;; cdr is in rax
      (mov (& 8 (% . rsp)) (% . rax))  ;; car is on top of stack
      (mov (% . rax) (& 16 (% . rbx))) ;; car
      (mov (% . rbx) (% . rax))  ;; the pair is located at 
      (add ($ . 18) (% . rax))   ;; 16+rbp, +2 for the GC (pair is b10)
      (add ($ . 32) (% . rbx))   ;; we used 32 bytes for this alloc
      (ret))))


(define %object-new-code
  ;; create an object q(length,type,empty data...).  Since object-new
  ;; does not handle any scheme objects except for two numbers we do
  ;; not need, if we run the GC, to check wether these two objects
  ;; were displaced or anything.
  
  ;; The data potentially put in the new object is displaced later so
  ;; it will be treated by the stack traversal of the GC
  (let ((elsel (gensym 'else)))
    `((push (% . rcx))
      (shr ($ . 2) (% . rax)) ;; length is in rax (second argument), encoded
      ;; now we're going to check if we still have enough space
      ;; if not, perform GC
      (mov (% . rax) (% . rcx))
      (add ($ . 16)  (% . rcx)) ;; length and type take 16 bytes
      (push (% . rcx))
      (add (% . rbx) (% . rcx))
      (sub (_ . %heap_current) (% . rcx)) ;; rcx \in [0,HEAP-SIZE]
      (cmp ($ . ,(quotient HEAP-SIZE 2)) (% . rcx))  ;; if rcx > HEAP-SIZE / 2
      (jl  (_ . ,elsel))
      (pop (% . rcx)) ;; this pop and push is there for a reason!
      (push (% . rcx))
      (call (_ . _std_%gc-routine))     ;; then GC
      (label ,elsel)
      (pop (% . rcx))
      (add (_ . %allocd_size) (% . rcx))
      (mov (% . rcx) (_ . %allocd_size))
      (mov (_ . %allocd_obj) (% . rcx))
      (inc (% . rcx))
      (mov (% . rcx) (_ . %allocd_obj))
      ;; allocate the object
      (mov (% . rax) (& 0 (% . rbx)))  
      (mov (& 16 (% . rsp)) (% . rcx))  ;; type is first argument, save in rcx
      (shr ($ . 2) (% . rcx))
      (mov (% . rcx) (& 8 (% . rbx)))
      (mov (% . rbx) (% . rcx))  ;; save rbx

      (add ($ . 16) (% . rbx))   
      (add (% . rax) (% . rbx)) ;; we used 16+rax bytes for this alloc

      (mov (% . rcx) (% . rax))  ;; put in rax the &obj, which is located at  
      (add ($ . 17) (% . rax))   ;; 16+rbx, +1 for the GC (obj is b01, rbx was in rcx)
      (pop (% . rcx))
      (ret))))

(define %object-setraw-code
  ;; &obj is 1st argument sp, +16
  ;; i is 2nd , sp + 8
  ;; value is 3rd, rax
  `((push (% . rcx))
    (push (% . rdx))
    (mov (& 24 (% . rsp)) (% . rcx)) ;; i
    (mov (& 32 (% . rsp)) (% . rdx)) ;; obj
    (sal ($ . 1) (% . rcx)) ;; since we're dealing with quads,
                            ;; multiply by 2 (it is already multiplied
                            ;; by 4 by the encoding)
    (mov (% . rax) (& -1 (% . rdx) (% . rcx)))
    (pop (% . rdx))
    (pop (% . rcx))
    (ret)))

(define %object-getraw-code
  ;; &obj is 1st argument sp +8
  ;; i is 2nd , rax
  ;; returns the 
  `((push (% . rcx))
    (mov (& 16 (% . rsp)) (% . rcx))
    (sal ($ . 1) (% . rax)) ;; since we're dealing with quads,
                            ;; multiply by 2 (it is already multiplied
                            ;; by 4 by the encoding)
    (mov (& -1 (% . rcx) (% . rax)) (% . rax))
    (pop (% . rcx))
    (ret)))

(define %object-setq-code
  ;; &obj is 1st argument sp, +16
  ;; i is 2nd , sp + 8
  ;; value is 3rd, rax
  `((push (% . rcx))
    (push (% . rdx))
    (mov (& 24 (% . rsp)) (% . rcx)) ;; i
    (mov (& 32 (% . rsp)) (% . rdx)) ;; obj
    (sar ($ . 2) (% . rax)) ;; decode value
    (sal ($ . 1) (% . rcx)) ;; since we're dealing with quads,
                            ;; multiply by 2 (it is already multiplied
                            ;; by 4 by the encoding)
    (mov (% . rax) (& -1 (% . rdx) (% . rcx)))
    (pop (% . rdx))
    (pop (% . rcx))
    (ret)))

(define %object-getq-code
  ;; &obj is 1st argument sp +8
  ;; i is 2nd , rax
  ;; returns the 
  `((push (% . rcx))
    (mov (& 16 (% . rsp)) (% . rcx))
    (sal ($ . 1) (% . rax)) ;; since we're dealing with quads,
                            ;; multiply by 2 (it is already multiplied
                            ;; by 4 by the encoding)
    (mov (& -1 (% . rcx) (% . rax)) (% . rax))
    (sal ($ . 2) (% . rax)) ;; encode value
    (pop (% . rcx))
    (ret)))


(define %object-setb-code
  ;; &obj is 1st argument sp + 16
  ;; i is 2nd , sp + 8
  ;; value is 3rd, rax
  ;; expects the value to be an encoded integer in [0;255]
  `((push (% . rcx))
    (push (% . rdx))
    (mov (& 32 (% . rsp)) (% . rcx)) ;; &obj
    (mov (& 24 (% . rsp)) (% . rdx)) ;; i
    (sar ($ . 2) (% . rax)) ;; decode value
    (sar ($ . 2) (% . rdx)) ;; decode index i
    (movb (% . al) (& -1 (% . rcx) (% . rdx)))
    (pop (% . rdx))
    (pop (% . rcx))
    (ret)))

(define %object-getb-code
  ;; returns the byte as an integer
  ;; &obj is 1st argument sp +8
  ;; i is 2nd , rax
  `((push (% . rcx))
    (push (% . rbx))
    (mov (& 24 (% . rsp)) (% . rcx))
    (mov (% . rax) (% . rbx))
    (sar ($ . 2) (% . rbx))
    (xor (% . rax) (% . rax))
    (movb (& -1 (% . rcx) (% . rbx)) (% . al))
    (pop (% . rbx))
    (pop (% . rcx))
    (shl ($ . 2) (% . rax))
    (ret)))


;; determine if %rax is a string
(define %object?-code
  (let ((ret_false (gensym 'ret_false))
        (end (gensym 'end)))
    `((push (% . rdx))
      (mov (% . rax) (% . rdx))
      ;; check if it's an obj pointer
      (and ($ . 3) (% . rax)) ;; 0b11 mask
      (cmp ($ . 1) (% . rax)) ;; it needs to end in 01
      (jne ,ret_false)
      ;; return true
      (mov ($ . ,enc#t) (% . rax))
      (jmp ,end)
      (label ,ret_false)
      (mov ($ . ,enc#f) (% . rax))
      (label ,end)
      (pop (% . rdx))
      (ret)
      )))

(define %object-type-code
  `((mov (& -9 (% . rax)) (% . rax))
    (shl ($ . 2) (% . rax))
    (ret)))

(define %object-length-code
  `((mov (& -17 (% . rax)) (% . rax))
    (shl ($ . 2) (% . rax))
    (ret)))

(define %object-address-code
  `((shl ($ . 2) (% . rax))
    (ret)))

(define %object-eqv?-code
  (let ((loop (gensym 'loop))
        (ret_false (gensym 'ret_false))
        (end (gensym 'end)))
    `((push (% . rbx))
      (push (% . rcx)) 
      (push (% . rdx)) 
      (push (% . rbp)) ;; temp registers
      (mov (& 40 (% . rsp)) (% . rcx)) ;; rcx = &y+1, rax = &x+1
      (mov (& -17 (% . rax)) (% . rdx)) ;; rdx = length of the first object
      (mov (& -17 (% . rcx)) (% . rbp)) ;; rbp = length of the 2nd object
      (cmp (% . rdx) (% . rbp)) ;; rdx!=rbp, not equal
      (jne (_ . ,ret_false)) ;; return false
      (mov ($ . 0) (% . rbp));; i=0
      (mov (% . rax) (% . rbx)) ;; rcx = &y+1, rbx = &x+1
      (label ,loop) ;; 
      (mov (& -1 (% . rcx) (% . rbp)) (% . al))
      (cmp (% . al) (& -1 (% . rbx) (% . rbp)))
      (jne (_ . ,ret_false))
      (inc (% . rbp)) 
      (cmp (% . rbp) (% . rdx))
      (jne ,loop)
      (mov ($ . ,enc#t) (% . rax)) ;; return true
      (jmp ,end)
      (label ,ret_false) 
      (mov ($ . ,enc#f) (% . rax)) ;; return false
      (label ,end)
      (pop (% . rbp))
      (pop (% . rdx))
      (pop (% . rcx))
      (pop (% . rbx))
      (ret))))


;; this is like object-eqv, but stops comparing after a null byte
;; (useful for null-terminated strings)
(define %object-eqz?-code
  (let ((loop (gensym 'loop))
        (ret_false (gensym 'ret_false))
        (ret_true (gensym 'ret_true))
        (end (gensym 'end)))
    `((push (% . rbx))
      (push (% . rcx)) 
      (push (% . rdx)) 
      (push (% . rbp)) ;; temp registers
      (mov (& 40 (% . rsp)) (% . rcx)) ;; rcx = &y+1, rax = &x+1
      (mov (& -17 (% . rax)) (% . rdx)) ;; rdx = length of the first object
      (mov (& -17 (% . rcx)) (% . rbp)) ;; rbp = length of the 2nd object
      (cmp (% . rdx) (% . rbp)) ;; rdx!=rbp, not equal
      (jne (_ . ,ret_false)) ;; return false
      (mov ($ . 0) (% . rbp));; i=0
      (mov (% . rax) (% . rbx)) ;; rcx = &y+1, rbx = &x+1
      (label ,loop) ;; 
      (mov (& -1 (% . rcx) (% . rbp)) (% . al))
      (cmp (% . al) (& -1 (% . rbx) (% . rbp)))
      (jne (_ . ,ret_false))
      (cmp ($ . 0) (% . al))
      (je (_ . ,ret_true))
      (inc (% . rbp)) 
      (cmp (% . rbp) (% . rdx))
      (jne ,loop)
      (label ,ret_true)
      (mov ($ . ,enc#t) (% . rax)) ;; return true
      (jmp ,end)
      (label ,ret_false) 
      (mov ($ . ,enc#f) (% . rax)) ;; return false
      (label ,end)
      (pop (% . rbp))
      (pop (% . rdx))
      (pop (% . rcx))
      (pop (% . rbx))
      (ret))))

(define %exit-code
  `((mov (% . rax) (% . rbx))
    (label asd)
    (movl ($ . 1) (% . eax))
    (int ($ . #x80))
    ;(syscall)
    (ret) ;;useless, but, why not
    ))

;; print what's in rax
(define print-x86
  (let ((fill_loop (gensym 'fill))
        (print_true (gensym 'true))
        (print_false (gensym 'false))
        (print_loop (gensym 'loop))
        (print_end (gensym 'end)))
    `((push (% . rbx))
      (push  (% . rdx))
      (push (% . rax))
      (push (% . rcx))
      (cmp ($ . ,enc#t) (% . rax))
      (je (_ . ,print_true))
      (cmp ($ . ,enc#f) (% . rax))
      (je (_ . ,print_false))
      (sar ($ . ,2) (% . rax))   ; else, it's a number, remove the two first bits
      (mov ($ . ,0) (% . rcx))   ; the number of loops done
      (test (% . rax) (% . rax))
      (jns (_ . ,fill_loop))
      (push (% . rax))
      (mov ($ . 45) (% . rax))
      (call (_ . _std_%putchar_rax))
      (pop (% . rax))
      (neg (% . rax))
      ;; each loop, divide by 10 and push the remainder on the stack
      (label ,fill_loop)
      (xor (% . rdx) (% . rdx))
      (mov ($ . ,10) (% . rbx))
      (div  (% . rbx))
      (add ($ . ,48) (% . rdx)) ; add ord('0') to rdx (which will be printed)
      (push (% . rdx))
      (inc (% . rcx))
      (cmp ($ . ,0) (% . rax))
      (jnz (_ . ,fill_loop))
      (label ,print_loop)
      (pop (% . rax))
      (call (_ . _std_%putchar_rax))
      (dec (% . rcx))
      (cmp ($ . ,0) (% . rcx))
      (jnz (_ . ,print_loop))
      (jmp (_ . ,print_end))
      (label ,print_true)
      (mov ($ . ,35) (% . rax))
      (call (_ .  _std_%putchar_rax))
      (mov ($ . ,116) (% . rax))
      (call (_ .  _std_%putchar_rax))
      (jmp (_ . ,print_end))
      (label ,print_false)
      (mov ($ . ,35) (% . rax))
      (call (_ .  _std_%putchar_rax))
      (mov ($ . ,102) (% . rax))
      (call (_ .  _std_%putchar_rax))
      (label ,print_end)
      ;;(mov ($ . ,10) (% . rax))        ; write newline to stdout
      ;;(call (_ . _std_%putchar_rax))

      (pop (% . rcx))
      (pop (% . rax))
      (pop (% . rdx))
      (pop (% . rbx))
      (ret))))

(define (getchar-code os)
  (cond
   ((eq? os 'osx)
    `((push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (push ($ . 0))                   ; buffer
      (lea (& ,0 (% . rsp)) (% . rsi)) ; get address of buffer
      (mov ($ . ,1) (% . rdx))         ; number of bytes to read = 1
      (mov ($ . ,0) (% . rdi))         ; file descriptor 0 = stdin
      (mov ($ . ,#x2000003) (% . rax)) ; "read" system call is 0x2000003
      (syscall)                        ; perform system call to OS
      (cmp ($ . ,1) (% . rax))         ; did we read 1 byte?
      (jz (_ . getchar1))
      (pop (% . rax))
      (shl ($ . 2) (% . rax))
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret)))      ; indicate end-of-file
   ((eq? os 'linux)
    `((push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (push ($ . ,0))                    ; buffer
      (lea (& ,0 (% . rsp)) (% . rsi))   ; get address of buffer
      (mov ($ . ,1) (% . rdx))           ; number of bytes to read = 1
      (mov ($ . ,0) (% . rdi))           ; file descriptor 0 = stdin
      (mov ($ . ,0) (% . rax))           ; "read" system call is 0
      (syscall)                          ; perform system call to OS
      (cmp ($ . ,1) (% . rax))           ; did we read 1 byte?
      (jne (_ . getchar1))
      (pop (% . rax))
      (shl ($ . 2) (% . rax))
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret)))))


(define (getchar1-code os)
  (cond
   ((eq? os 'osx)
    '((pop (% . rax))
      (mov ($ . -1) (% . rax))      ; indicate end-of-file
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret)))                             ; return
   ((eq? os 'linux)
    '((pop (% . rax))
      (mov ($ . -1) (% . rax))      ; indicate end-of-file
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret))))) ; return


(define %putchar-code
  `((shr ($ . 2) (% . rax))
    (call (_ . _std_%putchar_rax))
    (ret)))

(define (putchar-code os)
  (cond
   ((eq? os 'osx)
    `((label putchar_macosx)
      (push (% . rax))
      (push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (lea (& ,56 (% rsp)) (% . rsi))  ; get address of character to
                                        ; write
      (mov ($ . ,1) (% . rdx))         ; number of bytes to
                                        ; write = 1
      (mov ($ . ,1) (% . rdi))         ; file descriptor 1 = stdout
      (mov ($ . ,#x2000004) (% . rax)) ; "write" system call is 
                                        ; 0x2000004
      (syscall)                        ; perform system call to OS 
      (pop (% . rbx)) 
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (pop (% . rax))
      (ret)))                  ; return and pop parameter
   ((eq? os 'linux)
    `((push (% . rax))
      (push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (lea  (& ,56 (% . rsp)) (% . rsi)) ; get address of 
                                        ; character to write, which is in rax
      (mov  ($ . ,1) (% . rdx))          ; number of bytes to write = 1
      (mov  ($ . ,1) (% . rdi))          ; file descriptor 1 = stdout
      (mov  ($ . ,1) (% . rax))          ; "write" system call is 1
      (syscall)                          ; perform system call to OS
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (pop (% . rax))
      (ret)))))               ; return and pop parameter


(define (mmap_alloc-code os)
  (cond
   ((eq? os 'osx)
    `((push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (push (% . rax))
      (mov  ($ . 0) (% . rdi))  ;; address
      (mov  (& 64 (% . rsp)) (% . rsi)) ;; block length
      (mov  ($ . 7) (% . rdx)) ;; PROT_READ | PROT_WRITE | PROT_EXEC
      (mov  ($ . #x1002) (% . rcx)) ;; MAP_PRIVATE | MAP_ANON
      (mov  ($ . -1) (% . r8)) ;; file descriptor (-1 = none)
      (mov  ($ . 0) (% . r9)) ;; offset
      (mov  (% . rcx) (% . r10)) ;; unclear why this is needed
      (mov  ($ . #x20000c5) (% . rax)) ;; mmap is 0x20000c5 on mac os x
      (syscall)
      (pop (% . rax))
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret ($ . 8))))
   ((eq? os 'linux)
    `((push (% . r11))
      (push (% . rbp))
      (push (% . rsi))
      (push (% . rdi))
      (push (% . rdx))
      (push (% . rcx))
      (push (% . rbx))
      (mov  ($ . 0) (% . rdi))  ;; address
      (mov  (& 64 (% . rsp)) (% . rsi)) ;; block length
      (mov  ($ . 7) (% . rdx)) ;; PROT_READ | PROT_WRITE | PROT_EXEC
      (mov  ($ . #x22) (% . rcx)) ;; MAP_PRIVATE | MAP_ANON
      (mov  ($ . -1) (% . r8)) ;; file descriptor (-1 = none)
      (mov  ($ . 0) (% . r9)) ;; offset
      (mov  (% . rcx) (% . r10)) ;; unclear why this is needed
      (mov  ($ . 9) (% . rax)) ;; mmap is 9 on linux
      (syscall)
      (pop (% . rbx))
      (pop (% . rcx))
      (pop (% . rdx))
      (pop (% . rdi))
      (pop (% . rsi))
      (pop (% . rbp))
      (pop (% . r11))
      (ret ($ . 8))))))       ;; return and pop
    
    
