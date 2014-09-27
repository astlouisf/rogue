
(include "utils/pattern-matching.scm")
(include "utils/stack-env.scm")
(include "utils/constant-folding.scm")
(include "utils/higherorder.scm")

(include "stackvm.scm")
(include "read.scm")
(include "expand.scm")
(include "register_ir.scm")
(include "runtime.scm")
(include "peephole.scm")
;;(include "utils/x86-jit.scm")

(define os 
  (let ((os-str (with-input-from-process "uname" read-line)))
    (or (if (member os-str '("Darwin" "darwin")) 'osx #f)
        (if (member os-str '("Linux" "linux")) 'linux))))
(define verbose #f)


(define (main_ in-filename temp-filename out-filename do-jit use-stdlib)
  (let* ((file-output (open-output-file temp-filename))
         (string-writer (lambda (x) (display x file-output)))
         (scm-code (append '(%toplevel) 
                           (if use-stdlib (read-whole-file "stdlib.scm") '())
                           (read-whole-file in-filename))))
    (if verbose (print "got code!"))
    (let 
        ((code (expand scm-code
                       environment)))
    (x86-assembly-header string-writer)
    ;(if do-jit
    ;    (let ((rvalue
    ;           ((x86-jit-as-standalone (stack-to-x86 (translate-to-ir code)) os))))
    ;      (display "\nReturn value: ")
    ;      (display rvalue)
    ;      (newline))
        (begin
          (if verbose (print "translating to IR"))
          (translate-to-x86 (translate-to-ir code) string-writer)
          (if verbose (print "writing to file"))
          (x86-assembly-footer string-writer)
          (string-writer "\n\n// std_lib 4\n\n.text\n")
          (x86->assembly (runtime-env os use-stdlib) string-writer)
          (close-output-port file-output)
          (shell-command (string-append "gcc -g -o " out-filename " "
                                        temp-filename " lib/gc.c lib/io.c"))
          (if verbose (display "Compilation successfull!\n"))))))


(define (translate-to-ir ast)
  (define (optimise changed n code)
    (if (or (not changed) (= n 0))
        code
        (let ((c (peephole code)))
          (optimise (not (equal? c code)) (- n 1) c))))


  (let ((result (translate-ast ast runtime-globals)))
    (if verbose
        (begin
          ;;(display "Compiled to ir:\n")
          (display "Optimised?: ")
          (display "\n")
          ;;(pp o-result)
          (newline)))
    (optimise #t 3 result)))

(define (translate-to-x86 machine-code writer)
  (let ((result (stack-to-x86 machine-code)))
    (if verbose
        (begin
          (display "Compiled to x86:\n")
          ;(display result)
          (newline)
          (newline)))
    (x86->assembly result writer)))

(let* ((args (command-line))
       (src "main.scm")

       (src "test/270-letrec.scm")
       ;(src "test/700-jit.scm")
       (temp "out.s")
       (dest "out")
       (do-jit #f)
       (use-stdlib #t)
       (loop 
        (lambda (loop argv)
          (let ((argv argv))
          (if (pair? argv)
              (begin
                (cond 
                 ((equal? (car argv) "-t")
                  (set! temp (cadr argv))
                  (set! argv (cdr argv))) ;; skip one arg
                 ((equal? (car argv) "-j")
                  (set! do-jit #t))
                 ((equal? (car argv) "-v")
                  (set! verbose #t))
                 ((equal? (car argv) "-nostd")
                  (set! use-stdlib #f))
                 ((equal? (car argv) "-o")
                  (set! dest (cadr argv))
                  (set! argv (cdr argv))) ;; skip one arg
                 (else
                  (set! src (car argv))))
                  ;(set! src (string-append (car argv)))))
                (loop loop (cdr argv))))))))
  (if (not (equal? (car args) "gsi"))
      (loop loop (cdr args))) ;; the first argument is the program's name
  (main_ src temp dest do-jit use-stdlib))

