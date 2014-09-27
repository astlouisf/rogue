;;
;; Expand handle the compilation phase of macro expansion.
;; It recursively descend through the expression tree, evaluating macro on the
;; way. During the descend, it expands macro definition it encounters.
;;
;; Syntax analysis is being done during expansion. Since every bit of source
;; code pass through expansion and that expansion conserves data about
;; currently reachable definitions, it has been considered to be an ideal
;; phase to implement syntax analysis.
;; Analysis is being done inside each special-forms.
;;


(define (expand-error s . R)
  (error_ s R))




(define (expand expression env)
  (if (not (pair? expression))
      ;;(if (symbol? expression)     ;; production version
      (if #f                        ;; devel only version; comment accordingly
          (let ((matching-def (assoc expression env)))
            (cond
             ((not matching-def)
              (expand-error (string-append "Undefined symbol "
                                     (symbol->string expression) expression)))
             ((eq? 'macro (env-record-type matching-def))
              ;; If matching-def is a macro, it isn't at the beginning
              ;; of a list or it would have been expanded earlier. We
              ;; concluded that it must be a macro that is used as a
              ;; variable.
              (expand-error (string-append "Macro "
                                     (symbol->string expression)
                                     " cannot be used as a variable") expression))
             ((eq? 'var (env-record-type matching-def))
              expression)))
          expression)

      (let ((matching-macro (get-env-macro (car expression) env)))
        ;; If expression is a user-defined macro provided it hasn't been
        ;; overided by a local definition.
        (if matching-macro
            ;;(if (matching-macro expression)
            (expand (matching-macro expression) env);;)

            ;; Propagate expansion through primitive-forms.
            (match expression
             (('%toplevel . expr)
              (expand-toplevel expr env))

             (('%body expr)
              ;`(expanded-body ,expr))
              ;;(expand (expand-body `(%expanded-body ,@expr) env) env))
              (expand-body expr env))

             (('%lambda parameters ('%body exps))
              (let ((new-env (foldl (flip push-env-var)
                                    env
                                    (if (symbol? parameters)
                                        (list parameters)
                                        (to-clean-list parameters)))))
               `(%lambda
                 ,parameters
                 ,@(expand-body exps new-env))))

             (('%lambda parameters . exps)
              (let ((new-env (foldl (flip push-env-var)
                                    env (if (symbol? parameters)
                                            (list parameters)
                                            (to-clean-list parameters)))))
               `(%lambda
                 ,parameters
                 ,@(expand-body exps new-env))))

             (('%set! ref) `(%set! ,ref))
             (('%quote exp) `(%quote ,exp))
             (('quote exp)  `(quote ,exp))
             (('%unquote symbol) `(%unquote ,symbol))

             ;((head . tail) where (member head ('let))
             ; ())

             (exp-list
              (begin
              `(,@(map
                   (lambda (expression)
                     (expand expression env))
                   exp-list)))))))))







(define (expand-toplevel expression env)
  (define (fetch-expressions expressions
                             defines-stack
                             expression-queue
                             env)
    (if (null? expressions)
        (make-toplevel expression-queue
                       defines-stack
                       env)
        (match expressions
         ((('define (name . args) . expressions) . remaining-expressions)
          (fetch-expressions
            remaining-expressions
            (cons `(define ,name (lambda ,args ,@expressions))
                   defines-stack)
            expression-queue
            env))

         ((('define name expression) . remaining-expressions)
          (fetch-expressions
            remaining-expressions
            (cons (car expressions) defines-stack)
            expression-queue
            env))

         ((('define-type name . fields) . remaining-expressions)
          (begin
            (fetch-expressions
             remaining-expressions
             (append (expand-define-type name fields) defines-stack)
             expression-queue
             env)))

         ((('include path) . remaining-expressions)
          (fetch-expressions
           (append (read-whole-file path) remaining-expressions)
           defines-stack
           expression-queue
           env))

         ((('define-macro (name . args) . expressions) . remaining-expressions)
          (fetch-expressions
            remaining-expressions
            defines-stack
            expression-queue
            (push-env-macro
              name
              (eval `(lambda (expression)
                       (apply (lambda ,args ,@expressions) (cdr expression))))
              env)))

         ((('define-macro name
                          ('lambda args . expressions))
                        . remaining-expressions)
          (fetch-expressions
            remaining-expressions
            defines-stack
            expression-queue
            (push-env-macro
              name
              (eval `(lambda (expression)
                       (apply (lambda ,args ,@expressions) (cdr expression))))
              env)))

         ((('define-macro . _) . _) (expand-error "ill-formed macro" expressions))

         ((e . remaining-expressions )
          (fetch-expressions
            remaining-expressions
            defines-stack
            (append expression-queue (list e))
            env))
         (_ (expand-error "unexpected expression" expressions)))))


  (define (make-toplevel expressions defines env)
    `(%program
       ,@(if (null? defines)
          `(,@(expand expressions env))
          (let ((bindings 
                 (reverse (map (lambda (e)
                                 `(%set! ,(cadr e) ,(caddr e)))
                               defines)))
                (declarations (map (lambda (e)
                                     `(define-global ,(cadr e)))
                                   defines)))
            ;; letrec expansion handles env defs.
            (expand `(,@declarations ,@bindings ,@expressions) env)))))

  (let ((res (fetch-expressions expression '() '() env)))
    ;;(pp res)
    res))


(define (expand-define-type name fields)
  (define symbol-append
    (lambda syms
      (string->symbol (apply string-append (map symbol->string syms)))))
  (let ((type-sym (gensym 'user-type)))
    `((define ,(symbol-append 'make- name) (lambda P (cons ',type-sym P)))
      (define ,(symbol-append name '?) (lambda (x) (and (list? x)
                                                        (not (eq? (cdr x) '()))
                                                        (eq? (car x) ',type-sym))))
      ,@(map (lambda (field)
               `(define ,(symbol-append name '- field)
                  (lambda (obj)
                    (list-ref obj
                              ,(- (length fields)
                                  -1
                                  (length (member field fields)))))))
             fields)

      ,@(map (lambda (field)
               `(define ,(symbol-append name '- field '-set!)
                  (lambda (obj val)
                    (list-set! obj
                               ,(- (length fields)
                                   -1
                                   (length (member field fields)))
                               val))))
             fields))))





(define (expand-body expression env)
  (define (fetch-defines expressions defines  env)
    (if (null? expressions)
        (make-base-defines expressions defines env)
        (match expressions
               ((('define (name . args) . expressions) . remaining-expressions)
                (fetch-defines
                 remaining-expressions
                 (cons `(define ,name (lambda ,args ,@expressions))
                       defines)
                 env))

               ((('define name expression) . remaining-expressions)
                (fetch-defines
                 remaining-expressions
                 (cons (car expressions) defines)
                 env))

               ((('define-macro (name . args) . expressions) . remaining-expressions)
                (fetch-defines
                 remaining-expressions
                 defines
                 (push-env-macro
                  name
                  (eval `(lambda (expression)
                           (apply (lambda ,args ,@expressions) (cdr expression))))
                  env)))

               ((('define-macro name
                   ('lambda args . expressions))
                 . remaining-expressions)
                (fetch-defines
                 remaining-expressions
                 defines
                 (push-env-macro
                  name
                  (eval `(lambda (expression)
                           (apply (lambda ,args ,@expressions) (cdr expression))))
                  env)))

               ((('define-macro . _) . _) (expand-error "ill-formed macro" expressions))

               (_ (make-base-defines expressions defines env)))))

  (define (make-base-defines expressions defines env)
    ;;(display "base exp:    ")(pp expressions)
    ;;(display "base defines:")(pp defines)
    (if (null? defines)
        (expand expressions env)
        (let ((bindings (reverse (map (lambda (e)
                                        `(,(cadr e) ,(caddr e)))
                                      defines))))
          ;; return ((letrec...)) because expand-body must return a list of expressions
          ;; and not just a single expression
          (expand `((letrec ,bindings ,@expressions)) env)))) ;; letrec expansion
                                        ;; handles env defs.

  ;;(trace make-base-defines)
  ;;(trace fetch-defines)

  (fetch-defines expression '() env))




(define (expand-qq-u u)
  (if (pair? u)
      (expand-qq (car u) (cdr u))
      (if (null? u)
          '()
          (expand-qq u '()))))

(define (expand-qq head rest)
  (cond
   ((eq? head 'quasiquote)
    (expand-qq (caar rest) (cdar rest)))
   ;;(cons 'list (expand-qq (caar rest) (cdar rest))))
   ((pair? head)
    (cond 
     ((eq? (car head) 'unquote)
      `(%cons ,(cadr head) ,(expand-qq-u rest)))
     ((eq? (car head) 'unquote-splicing)
      `(append ,(cadr head) ,(expand-qq-u rest)))
     (else
      (list '%cons 
            (expand-qq (car head) (cdr head))
            (expand-qq-u rest)))))
   (else
    (cond
     ((symbol? head)
      (if (eq? head 'unquote)
          (car rest)
          (if (pair? rest)
              (list '%cons (list 'quote head)
                    (expand-qq-u rest))
              (list '%cons (list 'quote head)
                    (if (symbol? rest)
                        (list 'quote rest)
                        rest)))))
     (else
      (list '%cons head (expand-qq-u rest)))))))

;; Base macro environment
;;  |> lambda
;;  |> let
;;  |> let*
;;  |> letrec
;;  |> and
;;  |> or
;;  |> cond
;;  |> quasiquote
(define environment
  (list
   (cons 'lambda
    (make-env-record
      'macro
      (lambda (expression)
         (match expression
          ((_ params . expressions)
           where (or (parameter-list? params)
                     (expand-error "ill-formed parameters in lambda expression" expression))
           `(%lambda ,params (%body ,expressions)))
          (_ (expand-error "ill-formed lambda" expression))))))

   (cons 'begin
    (make-env-record
      'macro
      (lambda (expression)                    ;; must bypass lambda expansion
        `((%lambda () ,@(cdr expression)))))) ;; to prevent the addition of
                                              ;; a %body statement

   (cons 'case
    (make-env-record
     'macro
     (lambda (expression)
       (match expression
         (('case operand ('else . block))
          (let ((sym (gensym 'case-operand)))
            `(begin ,@block)))
         (('case operand (options . block) . rest)
          (let ((sym (gensym 'case-operand)))
            `(let ((,sym ,operand))
               (if (member ,sym ',options)
                   (begin ,@block)
                   (%case ,sym ,@rest)))))
         (_ (expand-error "ill-formed case" expression))))))

   (cons '%case
    (make-env-record
     'macro
     (lambda (expression)
       (match expression
         ((_ operand ('else . block))
          `(begin ,@block))
         ((_ operand (options . block) . rest)
          `(if (member ,operand ',options)
               (begin ,@block)
               (%case ,operand ,@rest)))
         ((_ operand)
          '())
         (_ (expand-error "ill-formed case" expression))))))


   (cons 'let
    (make-env-record
      'macro
      (lambda (expression)
        (match expression
         ((_ bindings . expressions)
          where (or (bindings? bindings)
                    (expand-error "ill-formed bindings in let" expression))

          (let ((binding-names (map car bindings))
                (binding-expressions (map cadr bindings)))
            `((lambda ,binding-names
               %body ,expressions)
              ,@binding-expressions)))
         (_ (expand-error "ill-formed let" expression))))))

   (cons 'letrec
    (make-env-record
      'macro
      (lambda (expression)
        (match expression
         ((_ bindings . expressions)
          where (or (bindings? bindings)
                    (expand-error "ill-formed bindings in letrec" expression))
          (let ((new-bindings (map (lambda (x)
                                     `(,(car x) 0))
                                   bindings))
                (new-values (map (lambda (x)
                                   `(%set! ,(car x) ,(cadr x)))
                                 bindings)))
            `(let ,new-bindings ,@new-values ,@expressions)))
         (_ (expand-error "ill-formed letrec" expression))))))

   (cons 'let*
    (make-env-record
      'macro
      (lambda (expression)
        (match expression
         ((_ bindings . expressions)
          where (or (bindings? bindings)
                    (expand-error "ill-formed bindings in let*" expression))
          `(let (,(car bindings))
             ,@(if (null? (cdr bindings))
                  expressions
                  `((let* ,(cdr bindings) ,@expressions)))))
         (_ (expand-error "ill-formed let*" expression))))))

   (cons 'if
    (make-env-record
      'macro
      (lambda (expression)
        (match expression
         ((_ cond true)
          `(%if ,cond ,true))
         ((_ cond true false)
          `(%if ,cond ,true ,false))
         (_ (expand-error "ill-formed if" expression))))))

   (cons 'set!
    (make-env-record
      'macro
      (lambda (expression)
        (match expression
         ((_ sym value) where (or (symbol? sym)
                                  (expand-error "set! should set a symbol not an expression" expression))
          `(%set! ,sym ,value))
         (_ (expand-error "ill-formed set!" expression))))))

   (cons 'and
   (make-env-record
     'macro
     (lambda (expression)
       (match expression
        ((_) '#t)
        ((_ x) x)
        ((_ x . xs)
         `(if ,x (and ,@xs) #f))
        (_ (expand-error "ill-formed and" expression))))))

   (cons 'or
    (make-env-record
      'macro
      (lambda (expression)
       (match expression
        ((_) '#f)
        ((_ x) x)
        ((_ x . xs)
         (let ((temp (gensym)))
           `(let ((,temp ,x))
              (if ,temp ,temp (or ,@xs)))))
        (_ (expand-error "ill-formed or" expression))))))

   (cons 'cond
    (make-env-record
     'macro
     (lambda (expression)
       (match expression
        ((_ ('else . clauses))
         `(begin ,@clauses))
        ((_ (test . clauses) . rest)
         `(if ,test
              (begin ,@clauses)
              ,@(if (= 0 (length rest))
                    '()
                    `((cond ,@rest)))))
        (_ (expand-error "ill formed cond" expression))))))


   (cons 'if
    (make-env-record
      'macro
      (lambda (expression)
       (match expression
        ((_ cnd then-clause else-clause)
          `(%if ,cnd ,then-clause ,else-clause))
        ((_ cnd then-clause)
          `(%if ,cnd ,then-clause))
        (_ (expand-error "ill-formed if expression" expression))))))

   (cons 'quasiquote
    (make-env-record
     'macro
     (lambda (expression)
       (if (pair? expression)
           (expand-qq (car expression) (cdr expression))
           (expand-qq expression '())))))

   (cons 'set!
    (make-env-record
      'macro
      (lambda (expression)
       (match expression
        ((_ id val )
          `(%set! ,id ,val))
        (_ (expand-error "ill-formed set! expression" expression))))))




;; Default macro pattern
;   (cons '
;    (make-environment-record
;      'macro
;      (lambda () ))

)) ;; closing environment definition


;; Syntax analysis function
(define (binding? binding)
  (match binding
   ((var expr) (symbol? var))
   (_ #f)))

(define (bindings? expressions)
  (foldl (lambda (acc x)
           (and (binding? x) acc))
         #t
         expressions))

(define (parameter-list? params)
  (or (symbol? params)
      (and (or (null? params) (pair? params))
           (foldl (lambda (acc x)
                    (and (symbol? x) acc))
                  #t
                  (to-clean-list params)))))
