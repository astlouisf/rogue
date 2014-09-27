;;(include "gensym.scm")

(define (range start stop)
  (if (>= start stop)
      '()
      (cons start (range (+ 1 start) stop))))


(define (%unclean-length L i)
  (if (null? L)
      i
      (if (pair? L)
          (%unclean-length (cdr L) (+ 1 i))
          (+ 1 i))))
(define (unclean-length L)
  (%unclean-length L 0))

(define comp-sym-table '())

;; translate an AST contained within an s-expr
;; to a stack machine code intermediate representation.
;; The virtual machine code is a list of lists of the form (instruction [operands...])
(define (translate-ast ast runtime-globals)
  (let* ((data (translate-ast-parts (fold-constants ast) '()))
         (global-code (cadr data))
         (global-decl (caddr data))
         (global-data (cadddr data))
         (code (append
                (car data)
                ;;(translate-ast-inner ast 0 '() append-to-global)
                '((acc 0)
                  (return))
                global-code)))
    (append 
     code
     `((.data)
       ;; these runtime globals are not scheme globals
       ,@(map (lambda (x) `(global ,x)) runtime-globals)
       (label globals_head)
       ,@(map (lambda (x) `(global ,x)) global-decl)
       (label globals_tail)
       ,@global-data))))

(define (translate-ast-parts ast globals)
  (let* ((global-code '())
         (global-decl '())
         (global-data '())
         (global-init '())
         (append-to-global 
          (lambda (m x) 
            (cond 
             ((eq? m 'decl)
              (set! global-decl
                    (cons x global-decl)))
             ((eq? m 'code)
              (set! global-code
                    (append global-code x)))
             ((eq? m 'init)
              (set! global-init
                    (append global-init x)))
             ((eq? m 'get-init)
              global-init)
             ((eq? m 'data)
              (set! global-data
                    (append global-data x))))))
         (code (translate-ast-inner (translate-closures ast) 0 
                                    (map (lambda (x) `(,x global)) globals)
                                    append-to-global)))
    (list code global-code global-decl global-data)))

(define debug-stack '())
(define (stackvm-error msg . argv)
  ;(pp (caddr debug-stack))
  ;(pp '------------------)
  ;(pp (cadr debug-stack))
  ;(pp '------------------)
  ;(pp (car debug-stack))
  (display argv)(newline)
  (display msg)(newline)
  (error_ msg '()))

;; translate the AST in data and append the result to
;; existing code
(define (translate-ast-inner data frame-size comp-env append-to-global)
  ;;(set! debug-stack (cons data debug-stack))
  (let* 
      ((gen-let
        (lambda (definitions)
          (append
           ;; code to calculate values in the "definitions"
           (apply append
                  (map
                   (lambda (def i)
                     (append (translate-ast-inner (cadr def)
                                                  (+ i frame-size)
                                                  comp-env
                                                  append-to-global)
                             (list (list 'push 'acc))))
                   definitions
                   (range 0 (length definitions))))
           ;; translate the body of the let
           (translate-ast-inner
            `(begin ,@(cddr data))
            (+ frame-size (length definitions))
            (append 
             (map (lambda (def i) (list (car def) 'local (+ frame-size i))) 
                  definitions
                  (range 0 (length definitions)))
             comp-env)
            append-to-global)
           ;; cleanup of "forget" the variables
           (apply list (map (lambda (x) '(pop)) definitions)))))

       (gen-if
        (lambda (condition then-br else-label end-label has-else)
          (append
           ;; first calculate the condition
           (translate-ast-inner condition frame-size comp-env append-to-global)
           ;; jump to else if it is false (zero)
           (list (list 'jump-false else-label))
           ;; if not do the "then" branch
           (translate-ast-inner then-br frame-size comp-env append-to-global)
           ;; if there is else, we want to jump to the end
           ;; of the conditional block
           (if has-else (list (list 'jump end-label)) '())
           ;; point to the start of the else block (or the end of 
           ;; the conditional if there is no else block)
           (list (list 'label else-label))
           (if has-else
               ;; else branch block
               (translate-ast-inner (cadddr data)
                                    frame-size
                                    comp-env
                                    append-to-global)
               '()) ;;else-br
           ;; indicate end of if
           (if has-else (list (list 'label end-label)) '()))))

       (gen-lambda
        (lambda (lsym params body)
          ;; the free variables of this lambda are the FV of the
          ;; lambda decl without the global variables, from which
          ;; we exclude local variables with the same name
          (let ((fv (set-diff (free-variables data)
                              (set-diff
                               (map (lambda (x) 
                                      (if (eq? 'global (cadr x))
                                          (car x)
                                          #f)) comp-env)
                               (map (lambda (x)
                                      (if (eq? 'local (cadr x))
                                          (car x)
                                          #f)) comp-env)))))
            (append-to-global
             'code
             `(;; what we align must start with #b01 and is of type
               ;; 'procedure
               (gc-align 1 ,(type-uid 'procedure))
               (label ,lsym)
               (procedure-header ,(if (symbol? params)
                                      1
                                      (unclean-length params)) ,(not (list? params)))
               ,@(translate-ast-inner
                  `(begin ,@body)
                  ;; a detail implementation is leaking here (or is
                  ;; it?): call pushes the return address on the stack
                  ;; thus the frame size is one plus the number of
                  ;; arguments passed (the return address being pushed
                  ;; last)
                  (+ 1 (unclean-length params)) 
                  (append 
                   (map (lambda (x i) (list x 'local i))
                        (if (symbol? params)
                            (list params)
                            (to-clean-list params))
                        (range 0 (unclean-length params) ))
                   (map (lambda (x i) (list x 'free i))
                        fv
                        (range 0 (length fv)))
                   (keep-globals-in-assoc comp-env))
                  append-to-global)
               (return)))
            `((load-address-of ,lsym)
              (push)
              ,@(apply append
                       (map (lambda (x i) (append (translate-ast-inner x (+ 1 i frame-size)
                                                                       comp-env append-to-global)
                                                  '((push))))
                            fv (range 0 (length fv))))
              (std %make-closure ,(+ 1 (length fv)))
              (pop ,(+ 1 (length fv)))))))

       ;; this is what is generated
       (code
        (if (pair? data)
            ;; let fun be the type of the instruction at hand
            (let ((fun (car data)))
              (cond 
               ;; when fun is an binary operation
               ((member fun '(%+ %- %* %quotient %= %< %<= %modulo %eq?))
                 ;; translate left and right and then the operator itself
                `(,@(translate-ast-inner (cadr data) frame-size comp-env append-to-global)
                  (push acc)
                  ,@(translate-ast-inner (caddr data) 
                                         (+ 1 frame-size) comp-env append-to-global)
                  (,(translate-op fun))
                  (pop)))
               ;; quote
               ((eq? fun 'quote)
                (if (pair? (cadr data))
                    ;;(error_ "list litterals not supported" data);;(pp 'list)
                    (translate-ast-inner 
                     (list-to-cons (cadr data))
                     frame-size comp-env append-to-global)
                    (if (symbol? (cadr data))
                        (let ((comp-sym (assoc (cadr data) comp-sym-table)))
                          (if (not comp-sym)
                              (let ((sym (gensym 'sym)))
                                (append-to-global 
                                 'data `((symbol-litt ,(symbol->string (cadr data)) ,sym)))
                                (set! comp-sym-table
                                      (cons (cons (cadr data) sym) comp-sym-table))
                                (append-to-global 
                                 'init 
                                 (translate-ast-inner
                                  `(%set! %sym-table (cons ',(cadr data) %sym-table))
                                  0 comp-env append-to-global))
                                (list (list 'load-address-of sym 1)))
                              ;; else load the already existing symbol
                              (list (list 'load-address-of (cdr comp-sym) 1))))
                              
                          ;; todo, add created symbol to list of symbols? also, don't generate same twice
                          
                        ;;(begin (pp 'symbol)
                        ;;       (pp (symbol->string (cadr data))))
                        ;;'((load-address-of %empty-list 1)))))
                        '((acc '())))))

               ((eq? fun '%compiler-init-flag)
                (append
                 (translate-ast-inner
                  `(begin 
                     (%set! %define-export-list
                            (list ,@(map (lambda (x) `(%cons ',(car x) ,(car x))) comp-env))))
                  frame-size comp-env append-to-global)
                 (append-to-global 'get-init 0)
                 '((label %user_main))))
               
               ;; Warning: using this function allows the called C
               ;; function to perform black magic since it is given
               ;; the current stack pointer. The argument passing
               ;; method is simply thus to push the given things on
               ;; the stack, and nothing prevents the called function
               ;; to manipulate data farther down the stack, for
               ;; example a C function could very well write on the
               ;; stack if it takes for granted that it knows the
               ;; position of a let-created variable.
               ((eq? fun '%call-extern-c-function)
                `(;; evaluate and push the given arguments on the stack
                  ,@(apply append
                           (map (lambda (x i) 
                                  (append
                                   (translate-ast-inner x (+ frame-size i) comp-env 
                                                        append-to-global)
                                   '((push acc))))
                                (cddr data)
                                (range 0 (length (cddr data)))))
                  (call-extern-c-function ,(cadr data))
                  (pop ,(length (cddr data)))))

                
               ;; standard arg-free runtime.scm functions
               ((member fun '(%getchar %gc-routine))
                (append
                 (list (list 'std fun))))
               ;; standard unary runtime.scm functions
               ((member fun '(%object? %object-type %object-length 
                                       %object-address
                                       %pair? %number?
                                       %print %putchar
                                       %exit))
                (append
                 (translate-ast-inner (cadr data) frame-size comp-env append-to-global)
                 (list (list 'std fun))))
               ;; standard >=binary runtime functions
               ((member fun '(%cons %object-eqv? %object-eqz?
                                    %object-new
                                    %object-setraw
                                    %object-setq
                                    %object-setb
                                    %object-getraw
                                    %object-getq
                                    %object-getb
                                    %apply
                                    %apply-closure
                                    %call-machine-code))
                `(,@(apply 
                     append
                     (map (lambda (x i) 
                            (append
                             (translate-ast-inner x (+ frame-size i) comp-env 
                                                  append-to-global)
                             (if (= i (- (length data) 2))
                                 '() ;; we want to push the arguments on the stack
                                 ;; except for the last
                                 '((push acc)))))
                          (cdr data)
                          (range 0 (- (length data) 1))))
                  (std ,fun)
                  (pop ,(- (length (cdr data)) 1))))
               ;; car cdr
               ;; since the address of the actual pair must end in b10
               ;; for the gc, it is offsetted by -2
               ((eq? fun '%car)
                `(,@(translate-ast-inner (cadr data) frame-size comp-env 
                                         append-to-global)
                  (load-from-offset -2))) ;; mov -2(%rax),%rax
               ((eq? fun '%cdr)
                `(,@(translate-ast-inner (cadr data) frame-size comp-env 
                                         append-to-global)
                  (load-from-offset 6)))
               ;; set-car! set-cdr!
               ((eq? fun '%set-car!)
                `(,@(translate-ast-inner (cadr data) frame-size comp-env 
                                         append-to-global)
                  (push acc)
                  ,@(translate-ast-inner (caddr data) (+ 1 frame-size) comp-env 
                                         append-to-global)
                  (store-at-offset -2)
                  (pop))) 
               ((eq? fun '%set-cdr!)
                `(,@(translate-ast-inner (cadr data) frame-size comp-env 
                                         append-to-global)
                  (push acc)
                  ,@(translate-ast-inner (caddr data) (+ 1 frame-size) comp-env 
                                         append-to-global)
                  (store-at-offset 6)
                  (pop)))
               ;; if fun is a let
               ((eq? fun 'let) 
                (let ((x (gen-let (cadr data))))
                  x))
               ;; if fun is a conditional
               ((eq? fun '%if)
                (gen-if (cadr data) ; condition
                        (caddr data) ; then-br 
                        (gensym 'else) ; else-label
                        (gensym 'end) ; end-label
                        (= (length data) 4))) ; has-else
               ((eq? fun '%set!)
                (append
                 (translate-ast-inner (caddr data) 
                                      frame-size
                                      comp-env 
                                      append-to-global)
                 (let ((v (assoc (cadr data) comp-env)))
                   (if v
                       (if (eq? 'global (cadr v))
                           `((store-global ,(cadr data)) (acc 0))
                           `((store-local ,(- frame-size (caddr v))) (acc 0)))
                       (stackvm-error "Trying to set! unknown variable" v)))))
               ((eq? fun 'define)
                (display data)
                (newline)
                (error "define statements can only be placed in begin or implicit begin blocks (internal error)"))

               ((member fun '(%expanded-body begin %program))
                (if (and (pair? (cadr data)) (eq? (caadr data) 'define-global))
                    (let ((defn-sexpr (cadr data))
                          (rest-sexpr (cddr data)))
                      (append-to-global 'decl (cadr defn-sexpr))
                      ;;(append
                      ;; (translate-ast-inner (caddr defn-sexpr) 
                      ;;                      frame-size
                      ;;                      (cons (list (cadr defn-sexpr) 'global)
                      ;;                            comp-env) 
                      ;;                      append-to-global)
                      ;; `((store-global ,(cadr defn-sexpr)))
                       (translate-ast-inner `(begin ,@rest-sexpr)
                                            frame-size 
                                            (cons (list (cadr defn-sexpr) 'global)
                                                  comp-env)
                                            append-to-global))
                    (apply append 
                           (map (lambda (x) (translate-ast-inner x frame-size comp-env
                                                                 append-to-global))
                                (cdr data)))))
               ;; lambda 
               ((eq? fun '%lambda)
                (gen-lambda (gensym 'lambda-decl) (cadr data) (cddr data)))
               ((or (assoc fun comp-env) (pair? fun))
                ;; function call:
                (if (and (pair? fun)
                         (eq? (car fun) '%lambda)
                         (eq? (length (cadr fun)) (length (cdr data))))
                    ;; optimise this form
                    ;;     ((lambda (x1 x2... xn) ...) c1 c2... cn)
                    ;; ==> (let ((x1 c1) (x2 c2) ...) ...) 
                    (translate-ast-inner 
                     `(let (,@(map list (cadr fun) (cdr data)))
                        ,@(cddr fun))
                     frame-size comp-env append-to-global)
                    ;; else it is a normal function call:
                    `(;; save the state (%rdi, closure*)
                      (save-state)
                      ;; evaluate and push the given arguments on the stack
                      ,@(apply append
                               (map (lambda (x i) 
                                      (append
                                       (translate-ast-inner x (+ frame-size i 1) comp-env 
                                                            append-to-global)
                                       '((push acc))))
                                    (cdr data)
                                    (range 0 (- (length data) 1))))
                      ;; evaluate what should be a lambda
                      ,@(translate-ast-inner fun (+ frame-size (length (cdr data)) 1)
                                             comp-env append-to-global)
                      (call ,(length (cdr data))) ;; call it
                      (pop ,(length (cdr data)))
                      (restore-state))))
               (else (stackvm-error "Unknown function or function form: " data))))
            ;; else of (if (pair? data))
            ;; if data is not a pair then it must be a number or
            ;; a symbol, so we need to push it on the stack
            (cond
             ((symbol? data)
              (let ((key (assoc data comp-env)))
                (if key
                    (if (eq? (cadr key) 'global)
                        (list (list 'load-global data))
                        (if (eq? (cadr key) 'free)
                            `((load-free ,(caddr key)))
                            (list (list 'load (- frame-size (caddr key))))))
                    (begin
                      (stackvm-error "Unknown variable at this point" data)))))
             ((string? data)
              (let ((sym (gensym 'str)))
                (append-to-global 
                 'data `((string-litt ,data ,sym)))
                (list (list 'load-address-of sym 1))))
             ((char? data)
              (translate-ast-inner
               `(integer->char ,(char->integer data))
               frame-size comp-env append-to-global))
             ((or (boolean? data)
                  (null? data)
                  (number? data)
                  (eof-object? data))
              (list (list 'acc data)))
             (else
              (stackvm-error "Don't know how to encode value" data))))))
    ;;(set! debug-stack (cdr debug-stack))
    code))

;(trace translate-ast-inner)

(define (list-to-cons L)
  (define (escape v)
    (if (symbol? v)
        (list 'quote v)
        (if (pair? v)
            (list-to-cons v)
            v)))
  (if (eq? L '())
      '()
      (if (pair? L)
          (list '%cons (escape (car L)) (list-to-cons (cdr L)))
          (escape L))))

(define (keep-globals-in-assoc L)
  (if (eq? L '())
      '()
     (begin
      (if (eq? 'global (cadr (car L)))
          (cons (car L) (keep-globals-in-assoc (cdr L)))
          (if (eq? 'free (cadr (car L)))
              (cons (car L) (keep-globals-in-assoc (cdr L)))
              (cons (list (caar L)
                          'free
                          (caddar L))
                    (keep-globals-in-assoc (cdr L))))))))

(define (translate-op op)
  (case op
    ((%+) 'add)
    ((%-) 'sub)
    ((%*) 'mul)
    ((%quotient) 'quotient)
    ((%modulo) 'mod)
    ((%= %eq?) 'equal)
    ((%<) 'less)
    ((%<=) 'lesseq)
    (else 'undefined-translated-op)))

(define (translate-let-init pair)
  ;;(pp pair)
  (append
   ;; return the initialisation code for the variable
   (translate-ast (cadr pair))
   ;; then the assign instruction
   (list (list 'assign (car pair)))))



(define (set-diff A B)
  (if (null? A) '()
      (if (member (car A) B)
          (set-diff (cdr A) B)
          (cons (car A) (set-diff (cdr A) B)))))

(define (set-union . L)
  (letrec
      ((loop 
        (lambda (new L)
          (if (null? L) new
              (if (null? (car L))
                  (loop new (cdr L))
                  (if (member (caar L) new)
                      (loop new (cons (cdar L) (cdr L)))
                      (loop (cons (caar L) new) (cons (cdar L) (cdr L)))))))))
    (loop '() L)))


(define (set-inter A B)
  (if (null? A) '()
      (if (member (car A) B)
          (cons (car A) (set-inter (cdr A) B))
          (set-inter (cdr A) B))))

(define (free-variables ast)
  (cond
   ((and (pair? ast) (eq? (car ast) '%lambda) )
    (set-diff (free-variables (cddr ast)) 
              (if (symbol? (cadr ast))
                  (list (cadr ast))
                  (to-clean-list (cadr ast)))))
   ((and (list? ast) (not (null? ast)) (not (eq? 'quote (car ast))))
    (apply set-union (map free-variables ast)))
   ((symbol? ast)
    (if (char=? (string-ref (symbol->string ast) 0) #\%)
        '()
        (list ast)))
   (else
    '())))


(define (translate-closures ast)
  (let ((globals '(+)))
    ;; collect only free variables inside a lambda expression
    (define (collect-fv ast inside-lambda)
      (cond
       ((and (pair? ast) (eq? (car ast) '%lambda) )
        (let ((args (if (symbol? (cadr ast))
                        (list (cadr ast))
                        (to-clean-list (cadr ast)))))
          (set-diff (collect-fv (cddr ast) #t) args)))
       ((and (pair? ast) (eq? (car ast) 'quote) )
        '())
       ((list? ast)
        (apply set-union (map (lambda (x) (collect-fv x inside-lambda)) ast)))
       ((and inside-lambda (symbol? ast))
        (list ast))
       (else
        '())))
    ;; unused
    (define (contains-lambda ast)
      (cond
       ((and (pair? ast) (eq? (car ast) '%lambda) )
        #t)
       ((list? ast)
        (not (member #f (map contains-lambda ast))))
       (else
        #f)))
    ;; modify the ast so that x -> (car x) and set! x -> (set-car! x)
    (define (modify-fv-access fv ast)
      (cond
       ((and (pair? ast) (eq? (car ast) '%lambda)) 
        (let ((args (if (symbol? (cadr ast))
                        (list (cadr ast))
                        (to-clean-list (cadr ast)))))
          (let ((fv (set-diff fv args)))
            `(%lambda ,(cadr ast) ,@(map (lambda (x) (modify-fv-access 
                                                      fv x))
                                         (cddr ast))))))
       ((and (pair? ast) (or (eq? (car ast) 'set!)
                             (eq? (car ast) '%set!)))
        (let ((v (member (cadr ast) fv)))
          (if v
              `(%set-car! ,(car v) ,@(map (lambda (x) (modify-fv-access fv x))
                                          (cddr ast)))
              `(%set! ,@(map (lambda (x) (modify-fv-access fv x))
                             (cdr ast))))))
       ((and (pair? ast) (eq? (car ast) 'quote) )
        ast)
       ((list? ast)
        (map (lambda (x) (modify-fv-access fv x)) ast))
       ((and (symbol? ast))
        (let ((v (member ast fv)))
          (if v
              `(%car ,ast)
              ast)))
       (else
        ast)))
    (define (tci ast)
      (cond 
       ((and (pair? ast) (eq? (car ast) '%lambda) )
        ;; collect free variables that are defined at this lambda[1],
        ;; generate new code accordingly: For each attached free
        ;; variable, a pair is created to store the given variable,
        ;; which is then get/set with car/set-car!
        ;;
        ;; [1] Are defined here the intersection of the parameters of
        ;;the lambda and the free variables of the inner expression
        (let* ((args (if (symbol? (cadr ast))
                         (list (cadr ast))
                         (to-clean-list (cadr ast))))
               (fv (set-inter args
                              (collect-fv (cddr ast) #f))))
          ;;(pp ast)
          ;;;(display "cddr ast:")(pp (cddr ast))
          ;;(pp fv)
          ;;(pp (collect-fv (cddr ast) #f))
          (if (null? fv)
              `(%lambda ,(cadr ast) ,@(tci (cddr ast)))
              `(%lambda ,(cadr ast) 
                 ;; se following comment for explanation
                 ;;((lambda ,fv
                 ((%lambda ,fv
                    ,@(tci (modify-fv-access fv (cddr ast))))
                  ;; the following generator line should be this:
                  ;; ,@(map (lambda (x) `(%cons ,x '())) fv)) but the
                  ;; way things are done, even if some of the lambda's
                  ;; variables are not free variables, they are put
                  ;; inside the newly created wrapper let/lambda which
                  ;; makes them free variables of this particular
                  ;; wrapper. Setting all the variables "free" works
                  ;; for now but it's definitely something to fix.
                  ,@(map (lambda (x) `(%cons ,x '())) fv))
                 ))))
       ((list? ast)
        (map tci ast))
       (else
        ast)))
    
    (map (lambda (x) 
           (if (pair? x)
               (if (eq? (car x) 'define)
                   (set! globals (cons (cadr x) globals)))))
         ast)
    (let ((k (tci ast)))
      k)))

