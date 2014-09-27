
(define (powi b e)
  (define (powi-it n b e)
    (if (= 0 e)
        n
        (powi-it (* b n) b (- e 1))))
  (powi-it 1 b e))

(define (hexp d)
  (if (eq? d '())
      (newline)
      (begin (if (number? (car d))
                 (display (number->string (car d) 16))
                 (display (car d)))
             (display " ")
             (hexp (cdr d)))))

(define (encode-to-bytes v n)
  (if (< v 0)
      (encode-to-bytes (+ (powi 2 (* 8 n)) v) n)
      (if (> n 0)
          (append 
           `(,(modulo v 256))
           (encode-to-bytes (quotient v 256) (- n 1)))
          '())))

(define last-pair
  (lambda (op)
    (if (eq? (cdr op) '())
        op
        (last-pair (cdr op)))))

(define (filter f list)
  (define (filter-it f list done)
    (filter-it
     f
     (cdr list)
     (append
      done
      (if (f (car list))
          `(,(car list))
          '()))))
  (filter-it f list))

(define (x86-jit-as-lambda asm globals)
  (let* ((block (x86-jit-inner asm globals)))
    (lambda argv
      (%call-machine-code block))))
    ;(hexp code)
    ;(u8vector->procedure (list->u8vector code))))
    
(define (x86-jit-inner all-asm globals)
  (let*
      ((code (list 'start)) 
       (end code) ;; pointer to the last pair
       (count 0) ;; the number of bytes used up to "now"
       (labels '()) ;; association list of known labels
       (labels-to-fill '()) ;; list of 4 byte label spots to fill on second pass
       (extern-references '())

       (encode 
        (lambda (operation)
          (pp operation)
          (case (car operation)
            ((mov) (apply gen-x86-mov (cdr operation)))
            ((push) (apply gen-x86-push (cdr operation)))
            ((pop) (apply gen-x86-pop (cdr operation)))
            ((add) (apply gen-x86-add (cdr operation)))
            ((sub) (apply gen-x86-sub (cdr operation)))
            ((inc) (apply gen-x86-inc (cdr operation)))
            ((dec) (apply gen-x86-dec (cdr operation)))
            ((lea) (apply gen-x86-lea (cdr operation)))
            ((idiv) (apply gen-x86-idiv (cdr operation)))
            ((div) (apply gen-x86-div (cdr operation)))
            ((imul) (apply gen-x86-imul (cdr operation)))
            ((cmp) (apply gen-x86-cmp (cdr operation)))
            ((test) (apply gen-x86-test (cdr operation)))
            ((je jne jg jge jl jle jna ja js jns jz jnz) 
             (apply gen-x86-jumpcc (cons (car operation) (cdr operation))))
            ((jmp) (apply gen-x86-jmp (cdr operation)))
            ((label) ;; add the adress of the label relative to the beginning of the code
             (set! labels (cons (list (cadr operation) count) labels))
             '())
            ((shr) (gen-x86-shift 'right (cadr operation) (caddr operation)))
            ((shl sal) (gen-x86-shift 'left (cadr operation) (caddr operation)))
            ((sar) (gen-x86-shift 'arithmetic-right
                                  (cadr operation) (caddr operation)))
            ((xor) (apply gen-x86-xor (cdr operation)))
            ((and) (apply gen-x86-and (cdr operation)))
            ((neg) (gen-x86-neg (cadr operation)))
            ((nop) (list #x90))
            ((call) (gen-x86-call (cadr operation) globals))
            ((syscall) (list #x0f #x05))
            ((ret) (gen-x86-ret (cdr operation)));(list #xc3))
            ((dot)
             (case (cadr operation)
               ((align) 
                (map (lambda x 0)
                     (listrange 0 (- (* 8 (caddr operation))
                                 (modulo count (* 8 (caddr operation)))))))
               ((byte)
                (encode-to-bytes (caddr operation) 1))
               ((quad)
                (encode-to-bytes (caddr operation) 8))
               ((data)
                ;; do something?
                '()
                )
               (else 
                (display "\n--Unknown dot operation:\n")
                (pp operation)
                (error "jit failed"))))
            (else (display "\n--\nUnknown operation:\n")
                  (pp operation)
                  (error "jit failed")))))

       (loop
        (lambda (loop asm)
          ;;(if (not (eq? '() asm)) 
          ;;    (begin (display (car asm)) (display " -> ")))
          (if (eq? asm '())
              '()
              (let*
                  ((opcodes (encode (car asm)))
                   (N (length opcodes)))
                (for-each 
                 (lambda (opcode)
                   (if (and (pair? opcode) (eq? (car opcode) 'label))
                       (begin
                         (set! labels-to-fill (cons 
                                               (list (cdr opcode) count N opcodes)
                                               labels-to-fill))
                         (if (assoc (cdr opcode) globals)
                             (begin
                               (print 'global)
                               (print (assoc (cdr opcode) globals))
                               (set! extern-references
                                     (cons (list (cdr (assoc (cdr opcode) globals)) count )
                                           extern-references))
                               (print extern-references)))
                         (set! count (+ count 3))))
                   (set! count (+ count 1)))
                 opcodes)
                ;;(hexp opcodes)
                (if (not (eq? opcodes '()))
                    (begin
                      (set-cdr! end opcodes)
                      (set! end (last-pair opcodes))))
                (loop loop (cdr asm))))))
       (replace-label
        (lambda (replace-label ops last nleft position name block-address)
          (if (or (eq? ops '()) (= 0 nleft))
              0
              (begin
                (if (and (pair? (car ops)) (eq? (caar ops) 'label))
                    (let* ((opcdr (cdr ops))
                           (label-data (assoc name labels))
                           (rel-adr 
                            (encode-to-bytes
                             (- (if (eq? 'extern (cadr label-data))
                                    (begin
                                      ;; we need to subtract 1 to the
                                      ;; block address because it is
                                      ;; an object pointer thus not
                                      ;; the real address of the block
                                      ;; (but incremented)
                                      (print position)
                                      (print (%object-address (caddr label-data)))
                                      (print block-address)
                                      (print 
                                      (- (%object-address (caddr label-data))
                                         (-  block-address 1)))
                                      (- (%object-address (caddr label-data))
                                         (-  block-address 1)))
                                    (cadr label-data))
                                (+ 4 position)) 4))) ;; +4 and not +6 because the adress of the
                      ;; label to fill is two bytes after the adress of the whole jump op
                      (print name)
                      (print rel-adr)
                      (set-cdr! last rel-adr)
                      (set-cdr! (last-pair rel-adr) opcdr)))
                (replace-label replace-label (cdr ops) ops (- nleft 1) position name block-address))))))
    (loop loop all-asm)
    (let* 
        (
         (extern-labels '()))
      (for-each
       (lambda (lab)
         (if (not (assoc (car lab) labels))
             (begin
               (display "Adding label ")
               (print lab)
               (set! labels (cons (list (car lab) 'extern (cdr (assoc (car lab) globals)))
                                  labels)))))
       labels-to-fill)
      (let*
          ((L (+ (%word-ceil count) (* 16 (+ 1 (length extern-references)))))
           (meta-data-start (quotient (- L (* 16 (+ 1 (length extern-references)))) 8))
           (block (%object-new type-uid-machine-code
                               L))
           (fill 
            (lambda (f c i)
              (if (< i count)
                  (begin
                    (%object-setb block i (car c))
                    (f f (cdr c) (+ i 1)))))))
        (pp labels)
        (for-each
         (lambda (lab)
           (if (not (assoc (car lab) labels))
               (begin
                 (display "\nUnknown label:\n  ")
                 (display (car lab))
                 (newline)
                 (error "jit error")))
           (replace-label replace-label
                          (list-ref lab 3)
                          #!eof ;; je me casse un peu la tete pour pas avoir a parcourir la liste
                          ;; deux fois, et je pense pas que un labelref puisse commencer un op
                          ;; donc de mettre void ici devrait rien faire planter
                          (list-ref lab 2)
                          (list-ref lab 1)
                          (list-ref lab 0)
                          (%object-address block)))
         labels-to-fill)
        (print code)
        (print extern-references)
        (print meta-data-start)
        (fill fill (cdr code) 0)
        (%object-setq block meta-data-start 0)
        (%object-setq block (+ 1 meta-data-start) 0)
        (let ((ipos 2))
          (for-each
           (lambda (ref)
             (%object-setraw block (+ ipos meta-data-start) (car ref))
             (%object-setq block (+ 1 ipos meta-data-start) (cadr ref))
             (set! ipos (+ 2 ipos)))
           extern-references))
        block))))


(define (gen-x86-ret args)
  (if (= 0 (length args))
      (list #xc3)
      (if (eq? '$ (caar args))
          `(#xc2 ,@(encode-to-bytes (cdar args) 2))
          (begin
            (display "\n Unknown ret:\n  ")
            (display args)
            (newline)
            (error "jit error")))))

(define (gen-x86-shift dir shamt dest)
  (let ((shamt (cdr shamt)))
    (if (< shamt 0)
        (error "Negative shift amount in shr?"))
    (if (>= shamt 128)
        (error "shift amount >= 128 in shr?"))
    (if (< shamt 128)
        (append
         `(#x48
           #xc1
           ,(+ #b11000000 
               (case dir
                 ((right) #b101000)
                 ((left)  #b100000)
                 ((arithmetic-right)
                  #b111000))
               (x86-register-id (cdr dest))))
         (encode-to-bytes shamt 1)))))

(define (gen-x86-mov src dest)
  (cond
   ((eq? '$ (car src)) ;; if it's an immediate
    (append
     `(#x48 
       #xc7 ;; mov r/m16/32/64 imm16/32
       ,(+ #b11000000 (x86-register-id (cdr dest)))) ;; modrm byte with immediate reg
     (encode-to-bytes (cdr src) 4)))

   ((eq? '& (car src))
    (gen-x86-indirect-adr '(#x48 #x8b)
                          (cdr (list-ref src 2))
                          (cadr src)
                          (cdr dest)))
   ((eq? '% (car src)) ;; if it's a register
    (cond
     ((eq? '% (car dest))
      (append
       `(#x48 
         #x89
         ,(+ #b11000000
             (* 8 (x86-register-id (cdr src)))
             (x86-register-id (cdr dest)))))) ;; modrm byte with immediate reg   
     ((eq? '_ (car dest))
      (append
       `(#x48 
         #x89
         ,(+ #b00000100
             (* 8 (x86-register-id (cdr src))))
         (label . ,(cdr dest)))))
     ((eq? '& (car dest))
      (gen-x86-indirect-adr
       '(#x48 
         #x89)
       (cdr (list-ref dest 2))
       (cadr dest)
       (cdr src)))
     (else
      (pp dest)
      (error "in mov unknown dest"))))
   ((eq? '_ (car src)) 
    ;; since we can't know the absolute address of
    ;; the label where we want to jump, we will cheat a little using 
    ;; lea x(%rip),R
    ;; where x will be the relative offset of the label compared to the IP
    ;; during the lea instruction, and R is (cdr dest)
    `(;; lea x(%rip),R
      #x48 #x8d ,(+ #b00000101
                    (* 8 (x86-register-id (cdr dest))))
           (label . ,(cdr src))
      ))

   (else 
    (display "unknown mov:")
    (write src)
    (write dest) (newline)
    (error "jit error"))))


(define (gen-x86-push dest)
  (cond 
   ((eq? '$ (car dest)) ;; if it's an immediate
    (cons #x68 (encode-to-bytes (cdr dest) 4)))
   ((eq? '% (car dest)) ;; if it's a register
    (let ((regid (x86-register-id (cdr dest))))
      (if (> 8 regid)
          `(,(+ #x50 regid))
          `(#x41 ,(+ #x50 (- regid 8))))))
   ((eq? '_ (car dest)) 
    ;; since we can't know the absolute address of
    ;; the label where we want to jump, we will cheat a little using 
    ;; lea x(%rip),%rax
    ;; where x will be the relative offset of the label compared to the IP
    ;; during the lea instruction. Since rax is not a temporary register and
    ;; we want push the value, we will surround the lea with:
    ;; `push %rax` and `xchg %rax,(%rsp)`
    `(,@(gen-x86-push '(% . rax))
      ;; lea x(%rip),%rax
      #x48 #x8d #x05 (label . ,(cdr dest))
      ;; xchg %rax,(%rsp)
      #x48 #x87 #x04 #x24
      ))
   (else (error "Unknown push"))))

(define (gen-x86-pop dest)
  (if (eq? '$ (car dest)) ;; if it's an immediate
      (error "pop imm32/64 not implemented"))
  (if (eq? '% (car dest)) ;; if it's a register
      (let ((regid (x86-register-id (cdr dest))))
        (if (> 8 regid)
            `(,(+ #x58 regid))
            `(#x41 ,(+ #x58 (- regid 8)))))))

(define (gen-x86-add src dest)
  (cond
   ((eq? '$ (car src)) ;; if it's an immediate
    (if (eq? (cdr dest) 'rax)
        (append
         `(#x48 
           #x05) ;; add rax imm16/32
         (encode-to-bytes (cdr src) 4))
        ;; if it's not rax:
        (append
         `(#x48 
           #x81 
           ,(+ #b11000000 (x86-register-id (cdr dest)))) ;; modrm byte with immediate reg
         (encode-to-bytes (cdr src) 4))))

   ((eq? '& (car src));; if it's indirect addressing
    (gen-x86-indirect-adr '(#x48 #x03)
                          (cdr (list-ref src 2))
                          (cadr src)
                          (cdr dest)))
   (else
    (display "Unknown/Unimplemented  operation in add:")
    (display src)
    (pp dest)
    (error "jit error"))))

(define (gen-x86-lea src dest)
  (cond
   ((eq? '& (car src));; if it's indirect addressing
    (gen-x86-indirect-adr '(#x48 #x8d)
                          (cdr (list-ref src 2))
                          (cadr src)
                          (cdr dest)))
   (else
    (display "Unknown/Unimplemented operation in lea:")
    (display src)
    (pp dest)
    (error "jit error"))))

(define (gen-x86-sub src dest)
  (cond
   ((eq? '$ (car src)) ;; if it's an immediate
    (if (eq? (cdr dest) 'rax)
        (append
         `(#x48 
           #x2d) ;; sub rax imm16/32
         (encode-to-bytes (cdr src) 4))
        ;; if it's not rax:
        (append
         `(#x48 
           #x81 
           ,(+ #b11101000 (x86-register-id (cdr dest)))) ;; modrm byte with immediate reg
         (encode-to-bytes (cdr src) 4))))
   ((eq? '% (car src))
    `(#x48 #x29
           ,(+ #b11000000
               (* 8 (x86-register-id (cdr src)))
               (x86-register-id (cdr dest)))))
   ((eq? '& (car src));; if it's indirect addressing
    (error "not implemented sub")
    (gen-x86-indirect-adr '(#x48 #x2d)
                          (cdr (list-ref src 2))
                          (cadr src)
                          (cdr dest)))
   (else
    (display "Unknown/Unimplemented  operation in sub:")
    (display src)
    (pp dest)
    (error "jit error"))))

(define (gen-x86-xor src dest)
  (cond
   ((eq? '$ (car src)) ;; if it's an immediate
    (if (eq? (cdr dest) 'rax)
        (append
         `(#x48 
           #x35)
         (encode-to-bytes (cdr src) 4))
        ;; if it's not rax:
        (append
         `(#x48 
           #x81 
           ,(+ #b11110000 (x86-register-id (cdr dest))))
         (encode-to-bytes (cdr src) 4))))
   ((eq? '% (car src))
    `(#x48
      #x31
      ,(+ #b11000000
          (* 8 (x86-register-id (cdr src)))
          (x86-register-id (cdr dest)))))
   (else
    (display "Unknown/Unimplemented operation in xor:")
    (display src)
    (pp dest)
    (error "jit error"))))

(define (gen-x86-and src dest)
  (cond
   ((eq? '$ (car src)) ;; if it's an immediate
    (if (eq? (cdr dest) 'rax)
        (append
         `(#x48 
           #x25)
         (encode-to-bytes (cdr src) 4))
        ;; if it's not rax:
        (append
         `(#x48 
           #x81 
           ,(+ #b11100000 (x86-register-id (cdr dest))))
         (encode-to-bytes (cdr src) 4))))
   ((eq? '% (car src))
    `(#x48
      #x21
      ,(+ #b11000000
          (* 8 (x86-register-id (cdr src)))
          (x86-register-id (cdr dest)))))
   (else
    (display "Unknown/Unimplemented operation in and:")
    (display src)
    (pp dest)
    (error "jit error"))))

(define (gen-x86-neg src)
  (if (not (eq? (car src) '%))
      (error "Neg should negate a register and nothing else"))
  `(#x48
    #xf7
    ,(+ #b11011000 (x86-register-id (cdr src)))))


(define (gen-x86-cmp src dest)
  (let ((modrm-base #b11111000)) ;; ModRM.Mod = 3, idk why
    ;; ModRM.Reg = 7, instruction modifier
    (cond
     ((eq? '$ (car src)) ;; immediate src
      (append
       `(#x48
         #x83 ;; same as add but with ModRM specifying a different op
         ,(+ modrm-base (x86-register-id (cdr dest))))
       (encode-to-bytes 
        (cdr src)
        (if (< (abs (cdr src)) 128) 1 4))))

     ((eq? '% (car src))
       `(#x48
         #x39
         ,(+ #b11000000
             (* 8 (x86-register-id (cdr src)))
             (x86-register-id (cdr dest)))))
     ((eq? '& (car src))
      (gen-x86-indirect-adr
       `(#x48
         #x3b)
         (cdr (list-ref src 2))
         (cadr src)
         (cdr dest))))))

(define (gen-x86-test src dest)
  (let ((modrm-base #b11000000))
    (cond
     ((eq? '$ (car src)) ;; immediate src
      (error "Unimplemented cmp $,%"))

     ((eq? '% (car src))
      `(#x48
        #x85
        ,(+ modrm-base 
            (x86-register-id (cdr dest))
            (* 8 (x86-register-id (cdr src))))))
     ((eq? '& (car src))
      (error "Unimplemented cmp $(%),%")))))


;; we are lazy, so we're always going to use jumps with rel32 and fill in the right
;; offset in time  
(define (gen-x86-jumpcc type target)
  (let ((table '((je  . #x84 )
                 (jz  . #x84 )
                 (jne . #x85 )
                 (jnz . #x85 )
                 (jna . #x86 )
                 (ja  . #x87 )
                 (js  . #x88 )
                 (jns . #x89 )
                 (jl  . #x8c ) ;less/ not ge
                 (jge . #x8d ) ;greater or eq/not less
                 (jle . #x8e ) ; less or equal
                 (jg  . #x8f ) ;greater/ not less or eq
                 
                 )))
    `(#x0f ,(cdr (assoc type table)) (label . ,(cdr target)))))

(define (gen-x86-jmp target)
  (cond
   ((eq? '_ (car target))
    `(#xe9 (label . ,(cdr target))))
   ((eq? '% (car target))
    `(#xff
      (+ #b11100000
         (x86-register-id (cdr target)))))
   (else
    (display "\nDon't understand this jmp:\n   ")
    (display target)
    (error "jit error"))))

(define (gen-x86-inc arg)
  `(#x48 #xff
         ,(+ #b11000000
             (x86-register-id (cdr arg)))))
(define (gen-x86-dec arg)
  `(#x48 #xff
         ,(+ #b11001000
             (x86-register-id (cdr arg)))))

(define (gen-x86-idiv arg)
  `(#x48 #xf7
         ,(+ #b11111000
             (x86-register-id (cdr arg)))))

(define (gen-x86-div arg)
  `(#x48 #xf7
         ,(+ #b11110000
             (x86-register-id (cdr arg)))))

(define (gen-x86-imul src dest)
  (cond
   ((eq? '$ (car src))
    (append
     `(#x48 #x69
            ,(+ #b11000000
                (* 8 (x86-register-id (cdr dest)))
                (x86-register-id (cdr dest))))
     (encode-to-bytes (cdr src) 4)))
   ((eq? '& (car src))
    (gen-x86-indirect-adr '(#x48 #x0f #xaf)
                          (cdr (list-ref src 2))
                          (cadr src)
                          (cdr dest)))
   ((eq? '% (car src))
    `(#x48 #x0f #xaf
           ,(+ #b11000000
               (* 8 (x86-register-id (cdr dest)))
               (x86-register-id (cdr src)))))
   (else
    (display src)
    (display "\n")
    (error "Unimplemented imul"))))



(define (gen-x86-je dest)  `(#x0f #x84 (label . ,(cdr dest))))
(define (gen-x86-jne dest) `(#x0f #x85 (label . ,(cdr dest))))
(define (gen-x86-jna dest) `(#x0f #x86 (label . ,(cdr dest))))
(define (gen-x86-ja dest)  `(#x0f #x87 (label . ,(cdr dest))))
(define (gen-x86-js dest)  `(#x0f #x88 (label . ,(cdr dest))))
(define (gen-x86-jns dest) `(#x0f #x89 (label . ,(cdr dest))))
(define (gen-x86-jl dest)  `(#x0f #x8c (label . ,(cdr dest)))) ;less/ not ge
(define (gen-x86-jge dest) `(#x0f #x8d (label . ,(cdr dest)))) ;greater or eq/not less
(define (gen-x86-jle dest) `(#x0f #x8e (label . ,(cdr dest)))) ; less or equal
(define (gen-x86-jg dest)  `(#x0f #x8f (label . ,(cdr dest)))) ;greater/ not less or eq

(define (gen-x86-call label globals)
  (if (eq? (car label) '_) 
      (let ((global (assoc (cdr label) globals)))
        (if global
            (begin
              (pp "GLOBAL")
              (pp global)
              (append
               (gen-x86-push '(% . rcx))
               (gen-x86-mov `($ . ,(cdr global)) '(% . rcx))
               `(#x48 #xff (+ #b11010000 (x86-register-id 'rcx))) ;; call
               (gen-x86-pop '(% . rcx))))
            ;; if it's not a global then it will be filled in somewhere
            `(#x48 #xe8 (label . ,(cdr label)))))
      ;; else:
      (if (and (eq? '* (car label)) (eq? '% (caadr label)))
          `(#xff ,(+ #b11010000 (x86-register-id (cdadr label))))
          (begin
            (display "Unknown call: ") (display label) (newline)
            (error "jit error")))))


(define (x86-register-id r)
  (case r
    ((accumulator rax eax ax) 0)
    ((temp rcx) 1)
    ((rdx) 2)
    ((rbx) 3)
    ((stack-pointer rsp) 4)
    ((rbp) 5)
    ((rsi) 6)
    ((rdi this) 7)
    ((r8) 8)
    ((r9) 9)
    ((r10) 10)
    ((r11) 11)
    ((r12) 12)
    ((r13) 13)
    ((r14) 14)
    ((r15) 15)
    (else (error (string-append "Unknown register: " (symbol->string r))))))

(define (x86-SIB mod index base)
  (+ (* 64 mod)
     (* 8 (x86-register-id index))
     (x86-register-id base)))

(define (gen-x86-indirect-adr opcodes base offset dest)
  (if (number? offset)
      (let ((modrm-base 
             (cond ((= offset 0) #b00000000)
                   ((< (abs offset) 128) #b01000000)
                   (else #b10000000))))
        (append 
         opcodes
         `(,(+ modrm-base 
               (x86-register-id base)
               (* 8 (x86-register-id dest))))
         (if (member base '(rsp stack-pointer))
             `(,(x86-SIB 0 'rsp 'rsp))
             '())
         (if (not (= 0 offset))
             (encode-to-bytes offset
                              (if (< (abs offset) 128) 1 4))
             '())))
      ;; if not a number
      (if (and (pair? offset) (eq? '_ (car offset)))
          (begin
            (if (not (eq? base 'rip))
                (error "Expected rip for indirect addressing of a label."))
            (append 
             opcodes
             `(#b00000101 (label . ,(cdr offset))))))))
             


;(define (u8vector->procedure code)
;  (machine-code-block->procedure
;   (u8vector->machine-code-block code)))

;(define (u8vector->machine-code-block code)
;  (let* ((len (u8vector-length code))
;         (mcb (##make-machine-code-block len)))
;    (let loop ((i (fx- len 1)))
;      (if (fx>= i 0)
;          (begin
;            (##machine-code-block-set! mcb i (u8vector-ref code i))
;            (loop (fx- i 1)))
;          mcb))))

;(define (machine-code-block->procedure mcb)
;  (lambda (#!optional (arg1 0) (arg2 0) (arg3 0))
;    (%machine-code-block-exec mcb arg1 arg2 arg3)))


;(define (x86-jit-as-standalone code os)  
;  (x86-jit-as-lambda
;   (append
;    code
;    '((ret))
;    (runtime-env os #t))))

(if #f
    (begin
      (pp
       ((x86-jit-as-lambda 
         '((push (_ . test))
           (mov (& 0 (% . rsp)) (% . rax))
           (add ($ . 8) (% . rsp))
           (call (* (% . rax)))
           (ret)
           (label test)
           (mov ($ . 40) (% . rax))
           (ret)
           ))))
      (exit 0)
      (pp
       ((x86-jit-as-lambda
         (append
          '((mov ($ . 5) (% . rax))
            (call (_ . print))
            (push ($ . 10))
            (push ($ . 65))
            (call (_ . putchar))
            (call (_ . putchar))
            (mov ($ . 44) (% . accumulator))
            (ret))
          ;(runtime-env 'linux)
          ))))

      '(
        '(
          '((mov ($ . 40) (% . rax))
           (call (_ . test_f))
           (mov ($ . 40) (% . rax))
           (ret)
           (label test_f)
           (sub ($ . 4) (% . rax))
           (cmp ($ . 20) (% . rax))
           (jle (_ . test_end))
           (call (_ . test_f))
           (label test_end)
            (mov ($ . 400) (% . accumulator))
            (push (% . rax))
            (add (& 0 (% . stack-pointer)) (% . accumulator))
            (add ($ . 8) (% . stack-pointer))
            (push (% . accumulator))
            (mov ($ . 8) (% . accumulator))
            (push (% . accumulator))
            (mov (& -16 (% . stack-pointer)) (% . accumulator))
            (add ($ . 8) (% . stack-pointer))
            (add ($ . 8) (% . stack-pointer))

            (push (% . rbx))
            (mov ($ . 400) (% . rbx))
            (mov (% . rbx) (% . rax))
            (cmp ($ . 80) (% . rbx))
            (jmp (_ . test2))
            (mov ($ . 40) (% . rbx))
            (label test)
            (sub ($ . 60) (% . rbx)) 
            (mov (% . rbx) (% . rax))
            (xor (% . rax) (% . rax))
            (mov ($ . 20) (% . rbx))
            (mov ($ . 400) (% . accumulator))
            (shr ($ . 2) (% . accumulator))
            (shr ($ . 2) (% . rbx))
            (xor (% . rdx) (% . rdx))
            (idiv (% . rbx))
            (shl ($ . 2) (% . accumulator))
            (label test2)
            (pop (% . rbx))
            (imul (% . rax) (% . rax))
            (mov ($ . -40) (% . rax))
            (test (% . rax) (% . rax))
            (js (_ . test3))
            (mov ($ . 40) (% . rax))
            (jmp (_ . test4))
            (label test3)
            (mov ($ . 100) (% . rax))
            (neg (% . rax))
            (label test4)
            )))))