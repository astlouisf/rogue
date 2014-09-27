    .globl main
    .text
main:
    mov %rdi, _p_argc
    mov %rsi, _p_argv
    push $268435456
    call mmap_alloc
    mov %rax, %rbx
    mov %rax, _p_heap_start
    mov %rax, _p_heap_current
    mov %rax, %rcx
    add $268435456, %rcx
    mov %rcx, _p_heap_end
    mov %rax, _p_alloc_ptr
    mov %rsp, _p_stack_top
    call _roc_main
    ret
_roc_main:
    mov $0, %rax
    mov %rax, type_d_uid_d_procedure
    mov $8, %rax
    mov %rax, type_d_uid_d_pair
    mov $168, %rax
    mov %rax, type_d_uid_d_string
    mov $172, %rax
    mov %rax, type_d_uid_d_symbol
    mov $176, %rax
    mov %rax, type_d_uid_d_char
    mov $180, %rax
    mov %rax, type_d_uid_d_vector
    mov $384, %rax
    mov %rax, type_d_uid_d_closure
    mov $388, %rax
    mov %rax, type_d_uid_d_machine_d_code
    mov $0, %rax
    lea lambda_d_decl35(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, error
    mov $0, %rax
    lea lambda_d_decl36(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, exit
    mov $0, %rax
    lea lambda_d_decl37(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, print
    mov $0, %rax
    mov print, %rax
    mov %rax, pp
    mov $0, %rax
    mov print, %rax
    mov %rax, pretty_d_print
    mov $0, %rax
    lea lambda_d_decl38(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, display
    mov $0, %rax
    lea lambda_d_decl43(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, write
    mov $0, %rax
    lea lambda_d_decl67(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_port_d_print
    mov $0, %rax
    lea lambda_d_decl70(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, write_d_char
    mov $0, %rax
    lea lambda_d_decl78(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, newline
    mov $0, %rax
    lea lambda_d_decl79(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, getchar
    mov $0, %rax
    lea lambda_d_decl80(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_print_d_string
    mov $0, %rax
    lea lambda_d_decl83(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_print_d_pair
    mov $0, %rax
    lea lambda_d_decl92(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, boolean_qm_
    mov $0, %rax
    lea lambda_d_decl95(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, equal_qm_
    mov $0, %rax
    lea lambda_d_decl104(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_error_nargs
    mov $0, %rax
    lea lambda_d_decl110(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, not
    mov $0, %rax
    lea lambda_d_decl113(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, number_qm_
    mov $0, %rax
    lea lambda_d_decl114(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_word_d_ceil
    mov $0, %rax
    lea lambda_d_decl115(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, member
    mov $0, %rax
    lea lambda_d_decl126(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, assoc
    mov $0, %rax
    lea lambda_d_decl140(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, procedure_qm_
    mov $0, %rax
    lea lambda_d_decl145(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, closure_qm_
    mov $0, %rax
    lea lambda_d_decl148(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, apply
    mov $0, %rax
    lea lambda_d_decl157(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, partial_d_sum
    mov $0, %rax
    lea lambda_d_decl160(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, eq_qm_
    mov $0, %rax
    lea lambda_d_decl161(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, eqv_qm_
    mov $11, %rax
    mov %rax, _p_sym_d_table
    mov $0, %rax
    lea lambda_d_decl170(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, symbol_qm_
    mov $0, %rax
    lea lambda_d_decl175(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, symbol_d__gt_string
    mov $0, %rax
    lea lambda_d_decl184(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d__gt_symbol
    mov $0, %rax
    lea lambda_d_decl205(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, unimap
    mov $0, %rax
    lea lambda_d_decl208(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, multimap
    mov $0, %rax
    lea lambda_d_decl213(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, map
    mov $0, %rax
    lea lambda_d_decl214(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, for_d_each
    mov $0, %rax
    lea lambda_d_decl217(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, eval
    mov $0, %rax
    mov %rax, _p_gensym_d_count
    mov $0, %rax
    lea lambda_d_decl219(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, gensym
    mov $3, %rax
    mov %rax, verbose
    mov $0, %rax
    mov %rax, _p_define_d_export_d_list
    mov $0, %rax
    lea lambda_d_decl223(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, null_qm_
    mov $0, %rax
    lea lambda_d_decl224(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cons
    mov $0, %rax
    lea lambda_d_decl225(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, car
    mov $0, %rax
    lea lambda_d_decl229(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdr
    mov $0, %rax
    lea lambda_d_decl233(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caar
    mov $0, %rax
    lea lambda_d_decl234(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cadr
    mov $0, %rax
    lea lambda_d_decl235(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdar
    mov $0, %rax
    lea lambda_d_decl236(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cddr
    mov $0, %rax
    lea lambda_d_decl237(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caaar
    mov $0, %rax
    lea lambda_d_decl238(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caadr
    mov $0, %rax
    lea lambda_d_decl239(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cadar
    mov $0, %rax
    lea lambda_d_decl240(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdaar
    mov $0, %rax
    lea lambda_d_decl241(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caddr
    mov $0, %rax
    lea lambda_d_decl242(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdadr
    mov $0, %rax
    lea lambda_d_decl243(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cddar
    mov $0, %rax
    lea lambda_d_decl244(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdddr
    mov $0, %rax
    lea lambda_d_decl245(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caaaar
    mov $0, %rax
    lea lambda_d_decl246(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caaadr
    mov $0, %rax
    lea lambda_d_decl247(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caadar
    mov $0, %rax
    lea lambda_d_decl248(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cadaar
    mov $0, %rax
    lea lambda_d_decl249(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdaaar
    mov $0, %rax
    lea lambda_d_decl250(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caaddr
    mov $0, %rax
    lea lambda_d_decl251(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cadadr
    mov $0, %rax
    lea lambda_d_decl252(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdaadr
    mov $0, %rax
    lea lambda_d_decl253(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdadar
    mov $0, %rax
    lea lambda_d_decl254(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cddaar
    mov $0, %rax
    lea lambda_d_decl255(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, caddar
    mov $0, %rax
    lea lambda_d_decl256(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cadddr
    mov $0, %rax
    lea lambda_d_decl257(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdaddr
    mov $0, %rax
    lea lambda_d_decl258(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cddadr
    mov $0, %rax
    lea lambda_d_decl259(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cdddar
    mov $0, %rax
    lea lambda_d_decl260(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, cddddr
    mov $0, %rax
    lea lambda_d_decl261(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, set_d_car_em_
    mov $0, %rax
    lea lambda_d_decl262(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, set_d_cdr_em_
    mov $0, %rax
    lea lambda_d_decl263(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, pair_qm_
    mov $0, %rax
    lea lambda_d_decl266(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, list_qm_
    mov $0, %rax
    lea lambda_d_decl275(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, length
    mov $0, %rax
    lea lambda_d_decl282(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, list
    mov $0, %rax
    lea lambda_d_decl283(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_append
    mov $0, %rax
    lea lambda_d_decl291(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, append
    mov $0, %rax
    lea lambda_d_decl294(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, list_d_ref
    mov $0, %rax
    lea lambda_d_decl304(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, list_d_set_em_
    mov $0, %rax
    lea lambda_d_decl314(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, reverse
    mov $0, %rax
    lea lambda_d_decl321(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, pair_d_equal_qm_
    mov $0, %rax
    lea lambda_d_decl332(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, listrange
    mov $0, %rax
    lea lambda_d_decl335(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _plus_
    mov $0, %rax
    lea lambda_d_decl338(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _star_
    mov $0, %rax
    lea lambda_d_decl341(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _d_
    mov $0, %rax
    lea lambda_d_decl344(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, quotient
    mov $0, %rax
    lea lambda_d_decl345(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, modulo
    mov $0, %rax
    lea lambda_d_decl346(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _eq_
    mov $0, %rax
    lea lambda_d_decl347(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _lt_
    mov $0, %rax
    lea lambda_d_decl348(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _gt_
    mov $0, %rax
    lea lambda_d_decl349(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _lt__eq_
    mov $0, %rax
    lea lambda_d_decl350(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _gt__eq_
    mov $0, %rax
    lea lambda_d_decl351(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, sum
    mov $0, %rax
    lea lambda_d_decl354(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, ilog
    mov $0, %rax
    lea lambda_d_decl357(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, pow
    mov $0, %rax
    lea lambda_d_decl360(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, abs
    mov $0, %rax
    lea lambda_d_decl363(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, integer_d__gt_string
    mov $0, %rax
    mov integer_d__gt_string, %rax
    mov %rax, number_d__gt_string
    mov $0, %rax
    lea lambda_d_decl374(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, char_qm_
    mov $0, %rax
    lea lambda_d_decl377(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, eof_d_object_qm_
    mov $0, %rax
    lea lambda_d_decl378(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, integer_d__gt_char
    mov $0, %rax
    lea lambda_d_decl379(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, char_d__gt_integer
    mov $0, %rax
    lea lambda_d_decl380(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, char_eq__qm_
    mov $0, %rax
    lea lambda_d_decl385(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, char_lt__eq__qm_
    mov $0, %rax
    lea lambda_d_decl386(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, char_gt__eq__qm_
    mov $0, %rax
    lea lambda_d_decl387(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_qm_
    mov $0, %rax
    lea lambda_d_decl390(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d_length
    mov $0, %rax
    lea lambda_d_decl397(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d_ref
    mov $0, %rax
    lea lambda_d_decl401(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d_set_em_
    mov $0, %rax
    lea lambda_d_decl407(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string
    mov $0, %rax
    lea lambda_d_decl414(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d_append
    mov $0, %rax
    lea lambda_d_decl427(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d_equal_qm_
    mov $0, %rax
    lea lambda_d_decl434(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, substring
    mov $0, %rax
    lea lambda_d_decl447(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, string_d__gt_number
    mov $0, %rax
    lea lambda_d_decl457(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, with_d_input_d_from_d_process
    mov $0, %rax
    lea lambda_d_decl458(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, open_d_pipe
    mov $0, %rax
    lea lambda_d_decl459(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, c_test2
    mov $0, %rax
    lea lambda_d_decl460(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, open_d_input_d_file
    mov $0, %rax
    lea lambda_d_decl461(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, open_d_output_d_file
    mov $0, %rax
    lea lambda_d_decl462(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, close_d_output_d_port
    mov $0, %rax
    lea lambda_d_decl463(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, read_d_char
    mov $0, %rax
    lea lambda_d_decl466(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, peek_d_char
    mov $0, %rax
    lea lambda_d_decl469(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_write_d_char
    mov $0, %rax
    lea lambda_d_decl470(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, write_d_string
    mov $0, %rax
    lea lambda_d_decl474(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, read_d_line
    mov $0, %rax
    lea lambda_d_decl480(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, shell_d_command
    mov $0, %rax
    mov %rax, _p_command_d_line_d_list
    mov $0, %rax
    lea lambda_d_decl481(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, command_d_line
    mov $0, %rax
    lea lambda_d_decl485(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, vector_qm_
    mov $0, %rax
    lea lambda_d_decl488(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, make_d_vector
    mov $0, %rax
    lea lambda_d_decl494(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, vector
    mov $0, %rax
    lea lambda_d_decl495(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, list_d__gt_vector
    mov $0, %rax
    lea lambda_d_decl502(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, vector_d_ref
    mov $0, %rax
    lea lambda_d_decl509(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, vector_d_set_em_
    mov $0, %rax
    lea lambda_d_decl516(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, vector_d_length
    mov $0, %rax
    lea lambda_d_decl520(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    mov %rax, _p_print_d_vector
    mov $0, %rax
    push %rdi
    lea sym525(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_procedure, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym526(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_pair, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym527(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym528(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_symbol, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym529(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym530(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_vector, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym531(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_closure, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym532(%rip), %rax
    add $1, %rax
    push %rax
    mov type_d_uid_d_machine_d_code, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym533(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym534(%rip), %rax
    add $1, %rax
    push %rax
    mov exit, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym535(%rip), %rax
    add $1, %rax
    push %rax
    mov print, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym536(%rip), %rax
    add $1, %rax
    push %rax
    mov pp, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym537(%rip), %rax
    add $1, %rax
    push %rax
    mov pretty_d_print, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym538(%rip), %rax
    add $1, %rax
    push %rax
    mov display, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym539(%rip), %rax
    add $1, %rax
    push %rax
    mov write, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym540(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_port_d_print, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym541(%rip), %rax
    add $1, %rax
    push %rax
    mov write_d_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym542(%rip), %rax
    add $1, %rax
    push %rax
    mov newline, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym543(%rip), %rax
    add $1, %rax
    push %rax
    mov getchar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym544(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_print_d_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym545(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_print_d_pair, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym546(%rip), %rax
    add $1, %rax
    push %rax
    mov boolean_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym547(%rip), %rax
    add $1, %rax
    push %rax
    mov equal_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym548(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_error_nargs, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym549(%rip), %rax
    add $1, %rax
    push %rax
    mov not, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym550(%rip), %rax
    add $1, %rax
    push %rax
    mov number_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym551(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_word_d_ceil, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym552(%rip), %rax
    add $1, %rax
    push %rax
    mov member, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym553(%rip), %rax
    add $1, %rax
    push %rax
    mov assoc, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym554(%rip), %rax
    add $1, %rax
    push %rax
    mov procedure_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym555(%rip), %rax
    add $1, %rax
    push %rax
    mov closure_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym556(%rip), %rax
    add $1, %rax
    push %rax
    mov apply, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym557(%rip), %rax
    add $1, %rax
    push %rax
    mov partial_d_sum, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym558(%rip), %rax
    add $1, %rax
    push %rax
    mov eq_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym559(%rip), %rax
    add $1, %rax
    push %rax
    mov eqv_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym560(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym561(%rip), %rax
    add $1, %rax
    push %rax
    mov symbol_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym562(%rip), %rax
    add $1, %rax
    push %rax
    mov symbol_d__gt_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym563(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d__gt_symbol, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym564(%rip), %rax
    add $1, %rax
    push %rax
    mov unimap, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym565(%rip), %rax
    add $1, %rax
    push %rax
    mov multimap, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym566(%rip), %rax
    add $1, %rax
    push %rax
    mov map, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym567(%rip), %rax
    add $1, %rax
    push %rax
    mov for_d_each, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym568(%rip), %rax
    add $1, %rax
    push %rax
    mov eval, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym569(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_gensym_d_count, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym570(%rip), %rax
    add $1, %rax
    push %rax
    mov gensym, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym571(%rip), %rax
    add $1, %rax
    push %rax
    mov verbose, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym572(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_define_d_export_d_list, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym573(%rip), %rax
    add $1, %rax
    push %rax
    mov null_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym574(%rip), %rax
    add $1, %rax
    push %rax
    mov cons, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym575(%rip), %rax
    add $1, %rax
    push %rax
    mov car, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym576(%rip), %rax
    add $1, %rax
    push %rax
    mov cdr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym577(%rip), %rax
    add $1, %rax
    push %rax
    mov caar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym578(%rip), %rax
    add $1, %rax
    push %rax
    mov cadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym579(%rip), %rax
    add $1, %rax
    push %rax
    mov cdar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym580(%rip), %rax
    add $1, %rax
    push %rax
    mov cddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym581(%rip), %rax
    add $1, %rax
    push %rax
    mov caaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym582(%rip), %rax
    add $1, %rax
    push %rax
    mov caadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym583(%rip), %rax
    add $1, %rax
    push %rax
    mov cadar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym584(%rip), %rax
    add $1, %rax
    push %rax
    mov cdaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym585(%rip), %rax
    add $1, %rax
    push %rax
    mov caddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym586(%rip), %rax
    add $1, %rax
    push %rax
    mov cdadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym587(%rip), %rax
    add $1, %rax
    push %rax
    mov cddar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym588(%rip), %rax
    add $1, %rax
    push %rax
    mov cdddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym589(%rip), %rax
    add $1, %rax
    push %rax
    mov caaaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym590(%rip), %rax
    add $1, %rax
    push %rax
    mov caaadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym591(%rip), %rax
    add $1, %rax
    push %rax
    mov caadar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym592(%rip), %rax
    add $1, %rax
    push %rax
    mov cadaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym593(%rip), %rax
    add $1, %rax
    push %rax
    mov cdaaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym594(%rip), %rax
    add $1, %rax
    push %rax
    mov caaddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym595(%rip), %rax
    add $1, %rax
    push %rax
    mov cadadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym596(%rip), %rax
    add $1, %rax
    push %rax
    mov cdaadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym597(%rip), %rax
    add $1, %rax
    push %rax
    mov cdadar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym598(%rip), %rax
    add $1, %rax
    push %rax
    mov cddaar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym599(%rip), %rax
    add $1, %rax
    push %rax
    mov caddar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym600(%rip), %rax
    add $1, %rax
    push %rax
    mov cadddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym601(%rip), %rax
    add $1, %rax
    push %rax
    mov cdaddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym602(%rip), %rax
    add $1, %rax
    push %rax
    mov cddadr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym603(%rip), %rax
    add $1, %rax
    push %rax
    mov cdddar, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym604(%rip), %rax
    add $1, %rax
    push %rax
    mov cddddr, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym605(%rip), %rax
    add $1, %rax
    push %rax
    mov set_d_car_em_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym606(%rip), %rax
    add $1, %rax
    push %rax
    mov set_d_cdr_em_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym607(%rip), %rax
    add $1, %rax
    push %rax
    mov pair_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym608(%rip), %rax
    add $1, %rax
    push %rax
    mov list_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym609(%rip), %rax
    add $1, %rax
    push %rax
    mov length, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym610(%rip), %rax
    add $1, %rax
    push %rax
    mov list, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym611(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_append, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym612(%rip), %rax
    add $1, %rax
    push %rax
    mov append, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym613(%rip), %rax
    add $1, %rax
    push %rax
    mov list_d_ref, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym614(%rip), %rax
    add $1, %rax
    push %rax
    mov list_d_set_em_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym615(%rip), %rax
    add $1, %rax
    push %rax
    mov reverse, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym616(%rip), %rax
    add $1, %rax
    push %rax
    mov pair_d_equal_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym617(%rip), %rax
    add $1, %rax
    push %rax
    mov listrange, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym618(%rip), %rax
    add $1, %rax
    push %rax
    mov _plus_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym619(%rip), %rax
    add $1, %rax
    push %rax
    mov _star_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym620(%rip), %rax
    add $1, %rax
    push %rax
    mov _d_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym621(%rip), %rax
    add $1, %rax
    push %rax
    mov quotient, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym622(%rip), %rax
    add $1, %rax
    push %rax
    mov modulo, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym623(%rip), %rax
    add $1, %rax
    push %rax
    mov _eq_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym624(%rip), %rax
    add $1, %rax
    push %rax
    mov _lt_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym625(%rip), %rax
    add $1, %rax
    push %rax
    mov _gt_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym626(%rip), %rax
    add $1, %rax
    push %rax
    mov _lt__eq_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym627(%rip), %rax
    add $1, %rax
    push %rax
    mov _gt__eq_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym628(%rip), %rax
    add $1, %rax
    push %rax
    mov sum, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym629(%rip), %rax
    add $1, %rax
    push %rax
    mov ilog, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym630(%rip), %rax
    add $1, %rax
    push %rax
    mov pow, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym631(%rip), %rax
    add $1, %rax
    push %rax
    mov abs, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym632(%rip), %rax
    add $1, %rax
    push %rax
    mov integer_d__gt_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym633(%rip), %rax
    add $1, %rax
    push %rax
    mov number_d__gt_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym634(%rip), %rax
    add $1, %rax
    push %rax
    mov char_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym635(%rip), %rax
    add $1, %rax
    push %rax
    mov eof_d_object_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym636(%rip), %rax
    add $1, %rax
    push %rax
    mov integer_d__gt_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym637(%rip), %rax
    add $1, %rax
    push %rax
    mov char_d__gt_integer, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym638(%rip), %rax
    add $1, %rax
    push %rax
    mov char_eq__qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym639(%rip), %rax
    add $1, %rax
    push %rax
    mov char_lt__eq__qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym640(%rip), %rax
    add $1, %rax
    push %rax
    mov char_gt__eq__qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym641(%rip), %rax
    add $1, %rax
    push %rax
    mov string_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym642(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_length, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym643(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_ref, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym644(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_set_em_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym645(%rip), %rax
    add $1, %rax
    push %rax
    mov string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym646(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_append, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym647(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_equal_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym648(%rip), %rax
    add $1, %rax
    push %rax
    mov substring, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym649(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d__gt_number, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym650(%rip), %rax
    add $1, %rax
    push %rax
    mov with_d_input_d_from_d_process, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym651(%rip), %rax
    add $1, %rax
    push %rax
    mov open_d_pipe, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym652(%rip), %rax
    add $1, %rax
    push %rax
    mov c_test2, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym653(%rip), %rax
    add $1, %rax
    push %rax
    mov open_d_input_d_file, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym654(%rip), %rax
    add $1, %rax
    push %rax
    mov open_d_output_d_file, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym655(%rip), %rax
    add $1, %rax
    push %rax
    mov close_d_output_d_port, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym656(%rip), %rax
    add $1, %rax
    push %rax
    mov read_d_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym657(%rip), %rax
    add $1, %rax
    push %rax
    mov peek_d_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym658(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_write_d_char, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym659(%rip), %rax
    add $1, %rax
    push %rax
    mov write_d_string, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym660(%rip), %rax
    add $1, %rax
    push %rax
    mov read_d_line, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym661(%rip), %rax
    add $1, %rax
    push %rax
    mov shell_d_command, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym662(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_command_d_line_d_list, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym663(%rip), %rax
    add $1, %rax
    push %rax
    mov command_d_line, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym664(%rip), %rax
    add $1, %rax
    push %rax
    mov vector_qm_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym665(%rip), %rax
    add $1, %rax
    push %rax
    mov make_d_vector, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym666(%rip), %rax
    add $1, %rax
    push %rax
    mov vector, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym667(%rip), %rax
    add $1, %rax
    push %rax
    mov list_d__gt_vector, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym668(%rip), %rax
    add $1, %rax
    push %rax
    mov vector_d_ref, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym669(%rip), %rax
    add $1, %rax
    push %rax
    mov vector_d_set_em_, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym670(%rip), %rax
    add $1, %rax
    push %rax
    mov vector_d_length, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea sym671(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_print_d_vector, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov list, %rax
    mov $147, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $1176, %rsp
    pop %rdi
    mov %rax, _p_define_d_export_d_list
    mov $0, %rax
    push %rdi
    lea sym61(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym525(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym526(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym527(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym528(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym529(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym530(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym531(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym532(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym533(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym534(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym535(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym536(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym537(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym538(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym539(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym540(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym541(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym542(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym543(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym544(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym545(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym546(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym547(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym548(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym549(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym550(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym551(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym552(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym553(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym554(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym555(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym556(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym557(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym558(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym559(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym560(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym561(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym562(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym563(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym564(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym565(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym566(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym567(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym568(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym569(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym570(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym571(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym572(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym573(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym574(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym575(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym576(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym577(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym578(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym579(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym580(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym581(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym582(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym583(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym584(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym585(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym586(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym587(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym588(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym589(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym590(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym591(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym592(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym593(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym594(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym595(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym596(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym597(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym598(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym599(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym600(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym601(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym602(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym603(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym604(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym605(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym606(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym607(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym608(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym609(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym610(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym611(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym612(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym613(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym614(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym615(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym616(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym617(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym618(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym619(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym620(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym621(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym622(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym623(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym624(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym625(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym626(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym627(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym628(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym629(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym630(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym631(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym632(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym633(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym634(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym635(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym636(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym637(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym638(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym639(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym640(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym641(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym642(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym643(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym644(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym645(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym646(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym647(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym648(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym649(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym650(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym651(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym652(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym653(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym654(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym655(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym656(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym657(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym658(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym659(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym660(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym661(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym662(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym663(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym664(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym665(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym666(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym667(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym668(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym669(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym670(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    push %rdi
    lea sym671(%rip), %rax
    add $1, %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
_p_user_main:
    push %rdi
    lea str672(%rip), %rax
    add $1, %rax
    push %rax
    mov open_d_input_d_file, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov read_d_line, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    lea str673(%rip), %rax
    add $1, %rax
    push %rax
    mov string_d_equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    add $16, %rsp
    mov $0, %rax
    pop %r9
    cmp $0, %r9
    jge g674
    add $8, %rsp
    neg %r9
g674:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl35:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist679
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart680
dolist679:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop675:
    cmp %rdi, %rcx
    je end676
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop675
end676:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop677:
    cmp $0, %rdi
    je end678
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop677
end678:
    pop %r8
    pop %rax
    pop %rdi
fstart680:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov print, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov $4, %rax
    call _std__p_exit
    pop %r9
    cmp $0, %r9
    jge g681
    add $8, %rsp
    neg %r9
g681:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl36:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_exit
    pop %r9
    cmp $0, %r9
    jge g682
    add $8, %rsp
    neg %r9
g682:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl37:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist687
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart688
dolist687:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop683:
    cmp %rdi, %rcx
    je end684
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop683
end684:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop685:
    cmp $0, %rdi
    je end686
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop685
end686:
    pop %r8
    pop %rax
    pop %rdi
fstart688:
    push %rdi
    mov display, %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov newline, %rax
    mov $0, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g689
    add $8, %rsp
    neg %r9
g689:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl38:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist694
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart695
dolist694:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop690:
    cmp %rdi, %rcx
    je end691
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop690
end691:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop692:
    cmp $0, %rdi
    je end693
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop692
end693:
    pop %r8
    pop %rax
    pop %rdi
fstart695:
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else39
    mov 16(%rsp), %rax
    jmp end40
else39:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end40:
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else41
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov _p_print_d_string, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end42
else41:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov write, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end42:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g696
    add $8, %rsp
    neg %r9
g696:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl43:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist701
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart702
dolist701:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop697:
    cmp %rdi, %rcx
    je end698
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop697
end698:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop699:
    cmp $0, %rdi
    je end700
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop699
end700:
    pop %r8
    pop %rax
    pop %rdi
fstart702:
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else44
    mov 16(%rsp), %rax
    jmp end45
else44:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end45:
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else46
    push %rdi
    push %rdi
    mov $136, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_string, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    push %rdi
    mov $136, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end47
else46:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $11, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else48
    push %rdi
    push %rdi
    mov $160, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $164, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end49
else48:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov eof_d_object_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else50
    push %rdi
    push %rdi
    mov $140, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $132, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    lea str52(%rip), %rax
    add $1, %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_string, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end51
else50:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else53
    push %rdi
    push %rdi
    mov $140, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $368, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end54
else53:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov symbol_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else55
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_string, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end56
else55:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else57
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    lea sym61(%rip), %rax
    add $1, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else59
    push %rdi
    push %rdi
    mov $156, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cadr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end60
else59:
    push %rdi
    push %rdi
    mov $160, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_pair, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $164, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end60:
    jmp end58
else57:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov vector_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else62
    push %rdi
    push %rdi
    mov $140, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $160, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov vector_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_vector, %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    push %rdi
    mov $164, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end63
else62:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov procedure_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else64
    push %rdi
    lea str66(%rip), %rax
    add $1, %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov display, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end65
else64:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_port_d_print, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end65:
end63:
end58:
end56:
end54:
end51:
end49:
end47:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g703
    add $8, %rsp
    neg %r9
g703:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl67:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else68
    mov 16(%rsp), %rax
    call _std__p_print
    jmp end69
else68:
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov number_d__gt_string, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov write_d_string, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end69:
    pop %r9
    cmp $0, %r9
    jge g704
    add $8, %rsp
    neg %r9
g704:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl70:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist709
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart710
dolist709:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop705:
    cmp %rdi, %rcx
    je end706
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop705
end706:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop707:
    cmp $0, %rdi
    je end708
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop707
end708:
    pop %r8
    pop %rax
    pop %rdi
fstart710:
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else71
    push %rdi
    lea str73(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else71:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else74
    mov 16(%rsp), %rax
    jmp end75
else74:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end75:
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else76
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_putchar
    jmp end77
else76:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov _p_write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end77:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g711
    add $8, %rsp
    neg %r9
g711:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl78:
    cmp $0, %rcx
    push $0
    jne _std__p_error_nargs
    add $8, %rsp
    mov $40, %rax
    call _std__p_putchar
    pop %r9
    cmp $0, %r9
    jge g712
    add $8, %rsp
    neg %r9
g712:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl79:
    cmp $0, %rcx
    push $0
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    call _std__p_getchar
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g713
    add $8, %rsp
    neg %r9
g713:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl80:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    cmp 0(%rsp), %rax
    je g714
    mov $3, %rax
    jmp g715
g714:
    mov $7, %rax
g715:
    add $8, %rsp
    cmp $3, %rax
    je else81
    mov $0, %rax
    jmp end82
else81:
    push %rdi
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    add 0(%rsp), %rax
    add $8, %rsp
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_string, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end82:
    add $40, %rsp
    pop %r9
    cmp $0, %r9
    jge g716
    add $8, %rsp
    neg %r9
g716:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl83:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else84
    mov 16(%rsp), %rax
    jmp end85
else84:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end85:
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else86
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else88
    push %rdi
    push %rdi
    mov $128, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else90
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_pair, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end91
else90:
    push %rdi
    push %rdi
    mov $184, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov $128, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end91:
else88:
else86:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g717
    add $8, %rsp
    neg %r9
g717:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl92:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $3, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else93
    mov 0(%rsp), %rax
    jmp end94
else93:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $7, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end94:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g718
    add $8, %rsp
    neg %r9
g718:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl95:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else96
    mov $7, %rax
    jmp end97
else96:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov string_d_equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else98
    mov $7, %rax
    jmp end99
else98:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov pair_d_equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else100
    mov $7, %rax
    jmp end101
else100:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov char_eq__qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else102
    mov $7, %rax
    jmp end103
else102:
    mov $3, %rax
end103:
end101:
end99:
end97:
    pop %r9
    cmp $0, %r9
    jge g719
    add $8, %rsp
    neg %r9
g719:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl104:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    lea str105(%rip), %rax
    add $1, %rax
    push %rax
    mov display, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov display, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else106
    push %rdi
    lea str108(%rip), %rax
    add $1, %rax
    push %rax
    mov display, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end107
else106:
    push %rdi
    lea str109(%rip), %rax
    add $1, %rax
    push %rax
    mov display, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end107:
    mov $4, %rax
    call _std__p_exit
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g720
    add $8, %rsp
    neg %r9
g720:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl110:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    cmp $3, %rax
    je else111
    mov $3, %rax
    jmp end112
else111:
    mov $7, %rax
end112:
    pop %r9
    cmp $0, %r9
    jge g721
    add $8, %rsp
    neg %r9
g721:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl113:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_number_qm_
    pop %r9
    cmp $0, %r9
    jge g722
    add $8, %rsp
    neg %r9
g722:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl114:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov $32, %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _star_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g723
    add $8, %rsp
    neg %r9
g723:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl116:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else117
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else119
    mov 16(%rsp), %rax
    jmp end120
else119:
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end120:
    jmp end118
else117:
    mov $3, %rax
end118:
    pop %r9
    cmp $0, %r9
    jge g724
    add $8, %rsp
    neg %r9
g724:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl115:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl116(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else123
    mov 0(%rsp), %rax
    jmp end124
else123:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end124:
    add $8, %rsp
    cmp $3, %rax
    je else121
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end122
else121:
    push %rdi
    lea str125(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end122:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g725
    add $8, %rsp
    neg %r9
g725:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl127:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else128
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else130
    push %rdi
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else132
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end133
else132:
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end133:
    jmp end131
else130:
    push %rdi
    lea str134(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end131:
    jmp end129
else128:
    mov $3, %rax
end129:
    pop %r9
    cmp $0, %r9
    jge g726
    add $8, %rsp
    neg %r9
g726:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl126:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl127(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else137
    mov 0(%rsp), %rax
    jmp end138
else137:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end138:
    add $8, %rsp
    cmp $3, %rax
    je else135
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end136
else135:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    lea str139(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end136:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g727
    add $8, %rsp
    neg %r9
g727:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl140:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else141
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_procedure, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else143
    mov 0(%rsp), %rax
    jmp end144
else143:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_closure, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end144:
    add $8, %rsp
    jmp end142
else141:
    mov $3, %rax
end142:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g728
    add $8, %rsp
    neg %r9
g728:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl145:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else146
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_closure, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end147
else146:
    mov $3, %rax
end147:
    pop %r9
    cmp $0, %r9
    jge g729
    add $8, %rsp
    neg %r9
g729:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl148:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else149
    push %rdi
    lea str151(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else149:
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov procedure_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else152
    push %rdi
    lea str154(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else152:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov closure_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else155
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    call _std__p_apply_d_closure
    add $8, %rsp
    jmp end156
else155:
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    call _std__p_apply
    add $8, %rsp
end156:
    pop %r9
    cmp $0, %r9
    jge g730
    add $8, %rsp
    neg %r9
g730:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl157:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $11, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else158
    mov $11, %rax
    jmp end159
else158:
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    push %rdi
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    add $8, %rsp
end159:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g731
    add $8, %rsp
    neg %r9
g731:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl160:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    cmp 0(%rsp), %rax
    je g732
    mov $3, %rax
    jmp g733
g732:
    mov $7, %rax
g733:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g734
    add $8, %rsp
    neg %r9
g734:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl161:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else162
    mov $7, %rax
    jmp end163
else162:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else166
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end167
else166:
    mov $3, %rax
end167:
    cmp $3, %rax
    je else164
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else168
    mov $7, %rax
    jmp end169
else168:
    mov $3, %rax
end169:
    jmp end165
else164:
    mov $3, %rax
end165:
end163:
    pop %r9
    cmp $0, %r9
    jge g735
    add $8, %rsp
    neg %r9
g735:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl170:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else171
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else173
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_symbol, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end174
else173:
    mov $3, %rax
end174:
    jmp end172
else171:
    mov $3, %rax
end172:
    pop %r9
    cmp $0, %r9
    jge g736
    add $8, %rsp
    neg %r9
g736:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl178:
    cmp $5, %rcx
    push $20
    jne _std__p_error_nargs
    add $8, %rsp
    mov 32(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    call _std__p_object_d_setb
    add $16, %rsp
    push %rdi
    push %rdi
    mov $0, %rax
    push %rax
    mov 64(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else181
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end182
else181:
    mov $3, %rax
end182:
    cmp $3, %rax
    je else179
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 64(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    mov $5, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $40, %rsp
    pop %rdi
    jmp end180
else179:
    mov 32(%rsp), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov $0, %rax
    call _std__p_object_d_setb
    add $16, %rsp
end180:
    pop %r9
    cmp $0, %r9
    jge g737
    add $8, %rsp
    neg %r9
g737:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl175:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov symbol_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else176
    mov type_d_uid_d_string, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_length
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    lea lambda_d_decl178(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_length
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    mov $5, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $40, %rsp
    pop %rdi
    mov 8(%rsp), %rax
    add $16, %rsp
    jmp end177
else176:
    push %rdi
    lea str183(%rip), %rax
    add $1, %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end177:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g738
    add $8, %rsp
    neg %r9
g738:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl185:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else188
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov symbol_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end189
else188:
    mov $3, %rax
end189:
    cmp $3, %rax
    je else186
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_length
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_length
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else190
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_eqz_qm_
    add $8, %rsp
    jmp end191
else190:
    mov $3, %rax
end191:
    jmp end187
else186:
    mov $3, %rax
end187:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g739
    add $8, %rsp
    neg %r9
g739:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl192:
    cmp $4, %rcx
    push $16
    jne _std__p_error_nargs
    add $8, %rsp
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else193
    mov $3, %rax
    jmp end194
else193:
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else195
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end196
else195:
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    pop %rdi
end196:
end194:
    add $32, %rsp
    pop %r9
    cmp $0, %r9
    jge g740
    add $8, %rsp
    neg %r9
g740:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl197:
    cmp $4, %rcx
    push $16
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    push %rdi
    mov 64(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov string_d_ref, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_setb
    add $16, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    push %rdi
    mov 72(%rsp), %rax
    push %rax
    mov string_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else198
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    pop %rdi
    jmp end199
else198:
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $0, %rax
    call _std__p_object_d_setb
    add $16, %rsp
end199:
    pop %r9
    cmp $0, %r9
    jge g741
    add $8, %rsp
    neg %r9
g741:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl184:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl185(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    lea lambda_d_decl192(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    lea lambda_d_decl197(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else200
    push %rdi
    lea str202(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else200:
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    cmp $3, %rax
    je else203
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    jmp end204
else203:
    mov type_d_uid_d_symbol, %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_length
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    push %rdi
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov _p_sym_d_table, %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_sym_d_table
    mov $0, %rax
    mov 0(%rsp), %rax
    add $8, %rsp
end204:
    add $56, %rsp
    pop %r9
    cmp $0, %r9
    jge g742
    add $8, %rsp
    neg %r9
g742:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl205:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else206
    mov $11, %rax
    jmp end207
else206:
    push %rdi
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov unimap, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end207:
    pop %r9
    cmp $0, %r9
    jge g743
    add $8, %rsp
    neg %r9
g743:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl208:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else211
    mov 0(%rsp), %rax
    jmp end212
else211:
    push %rdi
    mov $11, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov member, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end212:
    add $8, %rsp
    cmp $3, %rax
    je else209
    mov $11, %rax
    jmp end210
else209:
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    push %rdi
    mov car, %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov unimap, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    push %rdi
    mov cdr, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov unimap, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov multimap, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end210:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g744
    add $8, %rsp
    neg %r9
g744:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl213:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist749
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart750
dolist749:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop745:
    cmp %rdi, %rcx
    je end746
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop745
end746:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop747:
    cmp $0, %rdi
    je end748
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop747
end748:
    pop %r8
    pop %rax
    pop %rdi
fstart750:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov multimap, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g751
    add $8, %rsp
    neg %r9
g751:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl214:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else215
    push %rdi
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov for_d_each, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else215:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g752
    add $8, %rsp
    neg %r9
g752:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl217:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    lea str218(%rip), %rax
    add $1, %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    mov $4, %rax
    pop %r9
    cmp $0, %r9
    jge g753
    add $8, %rsp
    neg %r9
g753:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl219:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist758
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart759
dolist758:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop754:
    cmp %rdi, %rcx
    je end755
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop754
end755:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop756:
    cmp $0, %rdi
    je end757
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop756
end757:
    pop %r8
    pop %rax
    pop %rdi
fstart759:
    push %rdi
    mov $4, %rax
    push %rax
    mov _p_gensym_d_count, %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, _p_gensym_d_count
    mov $0, %rax
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else220
    push %rdi
    push %rdi
    lea str222(%rip), %rax
    add $1, %rax
    push %rax
    push %rdi
    mov _p_gensym_d_count, %rax
    push %rax
    mov integer_d__gt_string, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov string_d_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov string_d__gt_symbol, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end221
else220:
    push %rdi
    push %rdi
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov symbol_d__gt_string, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov _p_gensym_d_count, %rax
    push %rax
    mov integer_d__gt_string, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov string_d_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov string_d__gt_symbol, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end221:
    pop %r9
    cmp $0, %r9
    jge g760
    add $8, %rsp
    neg %r9
g760:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl223:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    cmp 0(%rsp), %rax
    je g761
    mov $3, %rax
    jmp g762
g761:
    mov $7, %rax
g762:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g763
    add $8, %rsp
    neg %r9
g763:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl224:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    call _std__p_cons
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g764
    add $8, %rsp
    neg %r9
g764:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl225:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else226
    push %rdi
    lea str228(%rip), %rax
    add $1, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else226:
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g765
    add $8, %rsp
    neg %r9
g765:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl229:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else230
    push %rdi
    lea str232(%rip), %rax
    add $1, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else230:
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g766
    add $8, %rsp
    neg %r9
g766:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl233:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g767
    add $8, %rsp
    neg %r9
g767:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl234:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g768
    add $8, %rsp
    neg %r9
g768:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl235:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g769
    add $8, %rsp
    neg %r9
g769:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl236:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g770
    add $8, %rsp
    neg %r9
g770:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl237:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g771
    add $8, %rsp
    neg %r9
g771:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl238:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g772
    add $8, %rsp
    neg %r9
g772:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl239:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g773
    add $8, %rsp
    neg %r9
g773:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl240:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g774
    add $8, %rsp
    neg %r9
g774:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl241:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g775
    add $8, %rsp
    neg %r9
g775:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl242:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g776
    add $8, %rsp
    neg %r9
g776:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl243:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g777
    add $8, %rsp
    neg %r9
g777:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl244:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g778
    add $8, %rsp
    neg %r9
g778:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl245:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g779
    add $8, %rsp
    neg %r9
g779:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl246:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g780
    add $8, %rsp
    neg %r9
g780:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl247:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g781
    add $8, %rsp
    neg %r9
g781:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl248:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g782
    add $8, %rsp
    neg %r9
g782:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl249:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g783
    add $8, %rsp
    neg %r9
g783:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl250:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g784
    add $8, %rsp
    neg %r9
g784:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl251:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g785
    add $8, %rsp
    neg %r9
g785:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl252:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g786
    add $8, %rsp
    neg %r9
g786:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl253:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g787
    add $8, %rsp
    neg %r9
g787:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl254:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g788
    add $8, %rsp
    neg %r9
g788:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl255:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g789
    add $8, %rsp
    neg %r9
g789:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl256:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g790
    add $8, %rsp
    neg %r9
g790:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl257:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g791
    add $8, %rsp
    neg %r9
g791:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl258:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g792
    add $8, %rsp
    neg %r9
g792:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl259:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g793
    add $8, %rsp
    neg %r9
g793:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl260:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    mov 6(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g794
    add $8, %rsp
    neg %r9
g794:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl261:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rcx
    mov 8(%rsp), %rcx
    mov %rax, -2(%rcx)
    pop %rcx
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g795
    add $8, %rsp
    neg %r9
g795:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl262:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rcx
    mov 8(%rsp), %rcx
    mov %rax, 6(%rcx)
    pop %rcx
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g796
    add $8, %rsp
    neg %r9
g796:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl263:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else264
    mov 8(%rsp), %rax
    call _std__p_pair_qm_
    jmp end265
else264:
    mov $3, %rax
end265:
    pop %r9
    cmp $0, %r9
    jge g797
    add $8, %rsp
    neg %r9
g797:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl266:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else267
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else269
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end270
else269:
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else271
    mov $7, %rax
    jmp end272
else271:
    mov $3, %rax
end272:
end270:
    jmp end268
else267:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else273
    mov $7, %rax
    jmp end274
else273:
    mov $3, %rax
end274:
end268:
    pop %r9
    cmp $0, %r9
    jge g798
    add $8, %rsp
    neg %r9
g798:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl276:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else277
    mov 16(%rsp), %rax
    jmp end278
else277:
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end278:
    pop %r9
    cmp $0, %r9
    jge g799
    add $8, %rsp
    neg %r9
g799:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl275:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl276(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else279
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end280
else279:
    push %rdi
    lea str281(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end280:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g800
    add $8, %rsp
    neg %r9
g800:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl282:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist805
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart806
dolist805:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop801:
    cmp %rdi, %rcx
    je end802
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop801
end802:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop803:
    cmp $0, %rdi
    je end804
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop803
end804:
    pop %r8
    pop %rax
    pop %rdi
fstart806:
    mov 8(%rsp), %rax
    pop %r9
    cmp $0, %r9
    jge g807
    add $8, %rsp
    neg %r9
g807:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl283:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else284
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else286
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else288
    mov $11, %rax
    jmp end289
else288:
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _p_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end289:
    jmp end287
else286:
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov _p_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end287:
    jmp end285
else284:
    push %rdi
    lea str290(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end285:
    pop %r9
    cmp $0, %r9
    jge g808
    add $8, %rsp
    neg %r9
g808:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl291:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist813
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart814
dolist813:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop809:
    cmp %rdi, %rcx
    je end810
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop809
end810:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop811:
    cmp $0, %rdi
    je end812
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop811
end812:
    pop %r8
    pop %rax
    pop %rdi
fstart814:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else292
    mov $11, %rax
    jmp end293
else292:
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _p_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end293:
    pop %r9
    cmp $0, %r9
    jge g815
    add $8, %rsp
    neg %r9
g815:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl295:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else296
    push %rdi
    lea str298(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end297
else296:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else299
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end300
else299:
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov $4, %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end300:
end297:
    pop %r9
    cmp $0, %r9
    jge g816
    add $8, %rsp
    neg %r9
g816:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl294:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl295(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else301
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end302
else301:
    push %rdi
    lea str303(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end302:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g817
    add $8, %rsp
    neg %r9
g817:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl305:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else306
    push %rdi
    lea str308(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end307
else306:
    mov 16(%rsp), %rax
    push %rax
    mov $0, %rax
    cmp 0(%rsp), %rax
    je g818
    mov $3, %rax
    jmp g819
g818:
    mov $7, %rax
g819:
    add $8, %rsp
    cmp $3, %rax
    je else309
    mov 24(%rsp), %rax
    push %rax
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rcx
    mov 8(%rsp), %rcx
    mov %rax, -2(%rcx)
    pop %rcx
    add $8, %rsp
    jmp end310
else309:
    push %rdi
    mov 32(%rsp), %rax
    mov 6(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $4, %rax
    mov %rax, %rcx
    mov 0(%rsp), %rax
    sub %rcx, %rax
    shr $2, %rax
    shl $2, %rax
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end310:
end307:
    pop %r9
    cmp $0, %r9
    jge g820
    add $8, %rsp
    neg %r9
g820:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl304:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl305(%rip), %rax
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else311
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end312
else311:
    push %rdi
    lea str313(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end312:
    add $32, %rsp
    pop %r9
    cmp $0, %r9
    jge g821
    add $8, %rsp
    neg %r9
g821:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl315:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else316
    mov 16(%rsp), %rax
    jmp end317
else316:
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    push %rdi
    mov 56(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end317:
    pop %r9
    cmp $0, %r9
    jge g822
    add $8, %rsp
    neg %r9
g822:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl314:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl315(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else318
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $11, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end319
else318:
    push %rdi
    lea str320(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end319:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g823
    add $8, %rsp
    neg %r9
g823:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl321:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else324
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end325
else324:
    mov $3, %rax
end325:
    cmp $3, %rax
    je else322
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else326
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else330
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end331
else330:
    mov $3, %rax
end331:
    cmp $3, %rax
    je else328
    mov $7, %rax
    jmp end329
else328:
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov pair_d_equal_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end329:
    jmp end327
else326:
    mov $3, %rax
end327:
    jmp end323
else322:
    mov $3, %rax
end323:
    pop %r9
    cmp $0, %r9
    jge g824
    add $8, %rsp
    neg %r9
g824:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl332:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov _gt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else333
    mov $11, %rax
    jmp end334
else333:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov listrange, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end334:
    pop %r9
    cmp $0, %r9
    jge g825
    add $8, %rsp
    neg %r9
g825:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl335:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist830
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart831
dolist830:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop826:
    cmp %rdi, %rcx
    je end827
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop826
end827:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop828:
    cmp $0, %rdi
    je end829
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop828
end829:
    pop %r8
    pop %rax
    pop %rdi
fstart831:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else336
    mov $0, %rax
    jmp end337
else336:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov _plus_, %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    add 0(%rsp), %rax
    add $8, %rsp
end337:
    pop %r9
    cmp $0, %r9
    jge g832
    add $8, %rsp
    neg %r9
g832:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl338:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist837
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart838
dolist837:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop833:
    cmp %rdi, %rcx
    je end834
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop833
end834:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop835:
    cmp $0, %rdi
    je end836
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop835
end836:
    pop %r8
    pop %rax
    pop %rdi
fstart838:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else339
    mov $4, %rax
    jmp end340
else339:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov _star_, %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    shr $2, %rax
    imul 0(%rsp), %rax
    add $8, %rsp
end340:
    pop %r9
    cmp $0, %r9
    jge g839
    add $8, %rsp
    neg %r9
g839:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl341:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist844
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart845
dolist844:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop840:
    cmp %rdi, %rcx
    je end841
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop840
end841:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop842:
    cmp $0, %rdi
    je end843
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop842
end843:
    pop %r8
    pop %rax
    pop %rdi
fstart845:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else342
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov %rax, %rcx
    mov 0(%rsp), %rax
    sub %rcx, %rax
    shr $2, %rax
    shl $2, %rax
    add $8, %rsp
    jmp end343
else342:
    mov 16(%rsp), %rax
    push %rax
    push %rdi
    mov _plus_, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov %rax, %rcx
    mov 0(%rsp), %rax
    sub %rcx, %rax
    shr $2, %rax
    shl $2, %rax
    add $8, %rsp
end343:
    pop %r9
    cmp $0, %r9
    jge g846
    add $8, %rsp
    neg %r9
g846:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl344:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    mov %rax, %rcx
    mov 0(%rsp), %rax
    shr $2, %rax
    shr $2, %rcx
    xor %rdx, %rdx
    idiv %rcx
    shl $2, %rax
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g847
    add $8, %rsp
    neg %r9
g847:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl345:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    mov %rax, %rcx
    mov 0(%rsp), %rax
    shr $2, %rax
    shr $2, %rcx
    xor %rdx, %rdx
    idiv %rcx
    mov %rdx, %rax
    shl $2, %rax
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g848
    add $8, %rsp
    neg %r9
g848:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl346:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    cmp 0(%rsp), %rax
    je g849
    mov $3, %rax
    jmp g850
g849:
    mov $7, %rax
g850:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g851
    add $8, %rsp
    neg %r9
g851:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl347:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    cmp 0(%rsp), %rax
    jg g852
    mov $3, %rax
    jmp g853
g852:
    mov $7, %rax
g853:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g854
    add $8, %rsp
    neg %r9
g854:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl348:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    cmp 0(%rsp), %rax
    jge g855
    mov $3, %rax
    jmp g856
g855:
    mov $7, %rax
g856:
    add $8, %rsp
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g857
    add $8, %rsp
    neg %r9
g857:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl349:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    cmp 0(%rsp), %rax
    jge g858
    mov $3, %rax
    jmp g859
g858:
    mov $7, %rax
g859:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g860
    add $8, %rsp
    neg %r9
g860:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl350:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    cmp 0(%rsp), %rax
    jg g861
    mov $3, %rax
    jmp g862
g861:
    mov $7, %rax
g862:
    add $8, %rsp
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g863
    add $8, %rsp
    neg %r9
g863:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl351:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else352
    mov $0, %rax
    jmp end353
else352:
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov sum, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end353:
    pop %r9
    cmp $0, %r9
    jge g864
    add $8, %rsp
    neg %r9
g864:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl354:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else355
    mov $0, %rax
    jmp end356
else355:
    push %rdi
    mov $4, %rax
    push %rax
    push %rdi
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov ilog, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end356:
    pop %r9
    cmp $0, %r9
    jge g865
    add $8, %rsp
    neg %r9
g865:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl357:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else358
    mov $4, %rax
    jmp end359
else358:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    push %rax
    mov $4, %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov pow, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _star_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end359:
    pop %r9
    cmp $0, %r9
    jge g866
    add $8, %rsp
    neg %r9
g866:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl360:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else361
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov _d_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end362
else361:
    mov 8(%rsp), %rax
end362:
    pop %r9
    cmp $0, %r9
    jge g867
    add $8, %rsp
    neg %r9
g867:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl364:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov _gt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else365
    mov $11, %rax
    jmp end366
else365:
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end366:
    pop %r9
    cmp $0, %r9
    jge g868
    add $8, %rsp
    neg %r9
g868:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl373:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    push %rdi
    push %rdi
    push %rdi
    mov $192, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    push %rdi
    mov 23(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $40, %rax
    push %rax
    push %rdi
    mov 15(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 112(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov pow, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov $40, %rax
    push %rax
    mov modulo, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    call _std__p_object_d_setb
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g869
    add $8, %rsp
    neg %r9
g869:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl363:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    lea lambda_d_decl364(%rip), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rcx
    mov 8(%rsp), %rcx
    mov %rax, -2(%rcx)
    pop %rcx
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else367
    lea str369(%rip), %rax
    add $1, %rax
    jmp end368
else367:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else370
    push %rdi
    lea str372(%rip), %rax
    add $1, %rax
    push %rax
    push %rdi
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _d_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov integer_d__gt_string, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov string_d_append, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end371
else370:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $40, %rax
    push %rax
    mov ilog, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov type_d_uid_d_string, %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _p_word_d_ceil, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    lea lambda_d_decl373(%rip), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 80(%rsp), %rax
    push %rax
    mov $4, %rcx
    call _std__p_make_d_closure
    add $32, %rsp
    push %rax
    push %rdi
    mov $0, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 72(%rsp), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov for_d_each, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    call _std__p_object_d_setb
    add $16, %rsp
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    add $32, %rsp
end371:
end368:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g870
    add $8, %rsp
    neg %r9
g870:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl374:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else375
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_char, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end376
else375:
    mov $3, %rax
end376:
    pop %r9
    cmp $0, %r9
    jge g871
    add $8, %rsp
    neg %r9
g871:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl377:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov $19, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g872
    add $8, %rsp
    neg %r9
g872:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl378:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov type_d_uid_d_char, %rax
    push %rax
    mov $32, %rax
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_setq
    add $16, %rsp
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g873
    add $8, %rsp
    neg %r9
g873:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl379:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    call _std__p_object_d_getq
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g874
    add $8, %rsp
    neg %r9
g874:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl380:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else383
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end384
else383:
    mov $3, %rax
end384:
    cmp $3, %rax
    je else381
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end382
else381:
    mov $3, %rax
end382:
    pop %r9
    cmp $0, %r9
    jge g875
    add $8, %rsp
    neg %r9
g875:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl385:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _lt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g876
    add $8, %rsp
    neg %r9
g876:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl386:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _gt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g877
    add $8, %rsp
    neg %r9
g877:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl387:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else388
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_string, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end389
else388:
    mov $3, %rax
end389:
    pop %r9
    cmp $0, %r9
    jge g878
    add $8, %rsp
    neg %r9
g878:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl391:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else392
    mov 16(%rsp), %rax
    jmp end393
else392:
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end393:
    pop %r9
    cmp $0, %r9
    jge g879
    add $8, %rsp
    neg %r9
g879:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl390:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl391(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else394
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end395
else394:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_qm_
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_type
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov pair_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov print, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    lea str396(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end395:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g880
    add $8, %rsp
    neg %r9
g880:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl397:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else398
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end399
else398:
    push %rdi
    lea str400(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end399:
    pop %r9
    cmp $0, %r9
    jge g881
    add $8, %rsp
    neg %r9
g881:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl401:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else404
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov char_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end405
else404:
    mov $3, %rax
end405:
    cmp $3, %rax
    je else402
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_setb
    add $16, %rsp
    jmp end403
else402:
    push %rdi
    lea str406(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
end403:
    pop %r9
    cmp $0, %r9
    jge g882
    add $8, %rsp
    neg %r9
g882:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl411:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else412
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_setb
    add $16, %rsp
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end413
else412:
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    call _std__p_object_d_setb
    add $16, %rsp
end413:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g883
    add $8, %rsp
    neg %r9
g883:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl407:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist888
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart889
dolist888:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop884:
    cmp %rdi, %rcx
    je end885
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop884
end885:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop886:
    cmp $0, %rdi
    je end887
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop886
end887:
    pop %r8
    pop %rax
    pop %rdi
fstart889:
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov $3, %rax
    push %rax
    push %rdi
    mov char_qm_, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov member, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else408
    push %rdi
    lea str410(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else408:
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov type_d_uid_d_string, %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _p_word_d_ceil, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl411(%rip), %rax
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    push %rdi
    mov $0, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    add $40, %rsp
    pop %r9
    cmp $0, %r9
    jge g890
    add $8, %rsp
    neg %r9
g890:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl415:
    cmp $6, %rcx
    push $24
    jne _std__p_error_nargs
    add $8, %rsp
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $3, %rax
    cmp $3, %rax
    je else418
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov $32, %rax
    push %rax
    mov _gt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end419
else418:
    mov $3, %rax
end419:
    cmp $3, %rax
    je else416
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    call _std__p_object_d_getq
    add $8, %rsp
    call _std__p_object_d_setq
    add $16, %rsp
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $32, %rax
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $32, %rax
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    mov $6, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $48, %rsp
    pop %rdi
    jmp end417
else416:
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    call _std__p_object_d_setb
    add $16, %rsp
    push %rdi
    push %rdi
    mov $0, %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else422
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end423
else422:
    mov $3, %rax
end423:
    cmp $3, %rax
    je else420
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 64(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    mov $6, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $48, %rsp
    pop %rdi
else420:
end417:
    add $48, %rsp
    pop %r9
    cmp $0, %r9
    jge g891
    add $8, %rsp
    neg %r9
g891:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl424:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist896
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart897
dolist896:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop892:
    cmp %rdi, %rcx
    je end893
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop892
end893:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop894:
    cmp $0, %rdi
    je end895
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop894
end895:
    pop %r8
    pop %rax
    pop %rdi
fstart897:
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g898
    add $8, %rsp
    neg %r9
g898:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl425:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist903
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart904
dolist903:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop899:
    cmp %rdi, %rcx
    je end900
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop899
end900:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop901:
    cmp $0, %rdi
    je end902
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop901
end902:
    pop %r8
    pop %rax
    pop %rdi
fstart904:
    mov $0, %rax
    pop %r9
    cmp $0, %r9
    jge g905
    add $8, %rsp
    neg %r9
g905:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl426:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist910
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart911
dolist910:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop906:
    cmp %rdi, %rcx
    je end907
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop906
end907:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop908:
    cmp $0, %rdi
    je end909
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop908
end909:
    pop %r8
    pop %rax
    pop %rdi
fstart911:
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    pop %r9
    cmp $0, %r9
    jge g912
    add $8, %rsp
    neg %r9
g912:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl414:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist917
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart918
dolist917:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop913:
    cmp %rdi, %rcx
    je end914
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop913
end914:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop915:
    cmp $0, %rdi
    je end916
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop915
end916:
    pop %r8
    pop %rax
    pop %rdi
fstart918:
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov string_d_length, %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov partial_d_sum, %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov partial_d_sum, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov sum, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov type_d_uid_d_string, %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _p_word_d_ceil, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    lea lambda_d_decl415(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    lea lambda_d_decl424(%rip), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    mov 112(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 104(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    lea lambda_d_decl425(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    mov 128(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $0, %rax
    push %rax
    mov 96(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 112(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    lea lambda_d_decl426(%rip), %rax
    push %rax
    mov 72(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    mov 152(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov map, %rax
    mov $7, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $56, %rsp
    pop %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    call _std__p_object_d_setb
    add $16, %rsp
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    add $88, %rsp
    pop %r9
    cmp $0, %r9
    jge g919
    add $8, %rsp
    neg %r9
g919:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl427:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else430
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov string_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end431
else430:
    mov $3, %rax
end431:
    cmp $3, %rax
    je else428
    push %rdi
    mov 24(%rsp), %rax
    call _std__p_object_d_length
    push %rax
    mov 24(%rsp), %rax
    call _std__p_object_d_length
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else432
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    call _std__p_object_d_eqz_qm_
    add $8, %rsp
    jmp end433
else432:
    mov $3, %rax
end433:
    jmp end429
else428:
    mov $3, %rax
end429:
    pop %r9
    cmp $0, %r9
    jge g920
    add $8, %rsp
    neg %r9
g920:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl442:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov $0, %rax
    push %rax
    mov 23(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else445
    push %rdi
    push %rdi
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 15(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end446
else445:
    mov $3, %rax
end446:
    cmp $3, %rax
    je else443
    mov 31(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 23(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    call _std__p_object_d_getb
    add $8, %rsp
    call _std__p_object_d_setb
    add $16, %rsp
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else443:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g921
    add $8, %rsp
    neg %r9
g921:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl434:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else437
    mov 0(%rsp), %rax
    jmp end438
else437:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _gt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else439
    mov 0(%rsp), %rax
    jmp end440
else439:
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov _gt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end440:
    add $8, %rsp
end438:
    add $8, %rsp
    cmp $3, %rax
    je else435
    push %rdi
    lea str441(%rip), %rax
    add $1, %rax
    push %rax
    mov error, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
else435:
    mov type_d_uid_d_string, %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _p_word_d_ceil, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl442(%rip), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 56(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $5, %rcx
    call _std__p_make_d_closure
    add $40, %rsp
    push %rax
    push %rdi
    mov $0, %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    add $48, %rsp
    pop %r9
    cmp $0, %r9
    jge g922
    add $8, %rsp
    neg %r9
g922:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl448:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov $0, %rax
    push %rax
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else451
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end452
else451:
    mov $3, %rax
end452:
    cmp $3, %rax
    je else449
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_getb
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $192, %rax
    push %rax
    mov _gt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else455
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $232, %rax
    push %rax
    mov _lt__eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end456
else455:
    mov $3, %rax
end456:
    cmp $3, %rax
    je else453
    push %rdi
    push %rdi
    push %rdi
    mov $40, %rax
    push %rax
    mov 56(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _star_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov $192, %rax
    push %rax
    mov _d_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 15(%rdi), %rax
    mov -2(%rax), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    jmp end454
else453:
    mov $3, %rax
end454:
    add $8, %rsp
    jmp end450
else449:
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
end450:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g923
    add $8, %rsp
    neg %r9
g923:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl447:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    lea lambda_d_decl448(%rip), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $3, %rcx
    call _std__p_make_d_closure
    add $24, %rsp
    push %rcx
    mov 8(%rsp), %rcx
    mov %rax, -2(%rcx)
    pop %rcx
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov $0, %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g924
    add $8, %rsp
    neg %r9
g924:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl457:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov open_d_pipe, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g925
    add $8, %rsp
    neg %r9
g925:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl458:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_popen
    pop %rsp
    pop %rdi
    add $8, %rsp
    mov 0(%rsp), %rax
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g926
    add $8, %rsp
    neg %r9
g926:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl459:
    cmp $0, %rcx
    push $0
    jne _std__p_error_nargs
    add $8, %rsp
    mov $8, %rax
    push %rax
    mov $16, %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call c_test
    pop %rsp
    pop %rdi
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g927
    add $8, %rsp
    neg %r9
g927:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl460:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_open_input_file
    pop %rsp
    pop %rdi
    add $8, %rsp
    mov 0(%rsp), %rax
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g928
    add $8, %rsp
    neg %r9
g928:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl461:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_open_output_file
    pop %rsp
    pop %rdi
    add $8, %rsp
    mov 0(%rsp), %rax
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g929
    add $8, %rsp
    neg %r9
g929:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl462:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_close_file
    pop %rsp
    pop %rdi
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g930
    add $8, %rsp
    neg %r9
g930:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl463:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_read_char
    pop %rsp
    pop %rdi
    add $8, %rsp
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _gt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else464
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end465
else464:
    mov $19, %rax
end465:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g931
    add $8, %rsp
    neg %r9
g931:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl466:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov $0, %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_peek_char
    pop %rsp
    pop %rdi
    add $8, %rsp
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov _gt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else467
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    jmp end468
else467:
    mov $19, %rax
end468:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g932
    add $8, %rsp
    neg %r9
g932:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl469:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov char_d__gt_integer, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_write_char
    pop %rsp
    pop %rdi
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g933
    add $8, %rsp
    neg %r9
g933:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl471:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else472
    push %rdi
    push %rdi
    mov 23(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_d_ref, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 15(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else472:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g934
    add $8, %rsp
    neg %r9
g934:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl470:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov string_d_length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl471(%rip), %rax
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov $4, %rcx
    call _std__p_make_d_closure
    add $32, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    add $40, %rsp
    pop %r9
    cmp $0, %r9
    jge g935
    add $8, %rsp
    neg %r9
g935:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl475:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov read_d_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov eof_d_object_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    cmp $3, %rax
    je else478
    mov 0(%rsp), %rax
    jmp end479
else478:
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $40, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov char_eq__qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end479:
    add $8, %rsp
    cmp $3, %rax
    je else476
    mov $11, %rax
    jmp end477
else476:
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov cons, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end477:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g936
    add $8, %rsp
    neg %r9
g936:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl474:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl475(%rip), %rax
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    push %rdi
    mov string, %rax
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov apply, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g937
    add $8, %rsp
    neg %r9
g937:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl480:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov open_d_pipe, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g938
    add $8, %rsp
    neg %r9
g938:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl484:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov $0, %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_get_argvi_len
    pop %rsp
    pop %rdi
    mov type_d_uid_d_string, %rax
    push %rax
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _p_word_d_ceil, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g939
    add $8, %rsp
    neg %r9
g939:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl481:
    cmp $0, %rcx
    push $0
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov $0, %rax
    push %rax
    mov _p_command_d_line_d_list, %rax
    push %rax
    mov eq_qm_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else482
    mov $0, %rax
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_get_argc
    pop %rsp
    pop %rdi
    push %rdi
    lea lambda_d_decl484(%rip), %rax
    push %rax
    mov $1, %rcx
    call _std__p_make_d_closure
    add $8, %rsp
    push %rax
    push %rdi
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov listrange, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov map, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov %rsp, %rdi
    and $-16, %rsp
    sub $8, %rsp
    push %rdi
    add $8, %rdi
    call io_fill_argv
    pop %rsp
    pop %rdi
    mov 0(%rsp), %rax
    mov %rax, _p_command_d_line_d_list
    mov $0, %rax
    mov 0(%rsp), %rax
    add $16, %rsp
    jmp end483
else482:
    mov _p_command_d_line_d_list, %rax
end483:
    pop %r9
    cmp $0, %r9
    jge g940
    add $8, %rsp
    neg %r9
g940:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl485:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    call _std__p_object_qm_
    cmp $3, %rax
    je else486
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_type
    push %rax
    mov type_d_uid_d_vector, %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end487
else486:
    mov $3, %rax
end487:
    pop %r9
    cmp $0, %r9
    jge g941
    add $8, %rsp
    neg %r9
g941:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl491:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else492
    mov 23(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 15(%rdi), %rax
    mov -2(%rax), %rax
    call _std__p_object_d_setraw
    add $16, %rsp
    push %rdi
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
else492:
    add $16, %rsp
    pop %r9
    cmp $0, %r9
    jge g942
    add $8, %rsp
    neg %r9
g942:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl488:
    push $-4
    cmp $1, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $1, %rcx
    cmp $0, %rcx
    jne dolist947
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart948
dolist947:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop943:
    cmp %rdi, %rcx
    je end944
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop943
end944:
    mov %rax, 32(%rsp)
    mov $1, %rdi
    mov %rcx, %r8
loop945:
    cmp $0, %rdi
    je end946
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop945
end946:
    pop %r8
    pop %rax
    pop %rdi
fstart948:
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov type_d_uid_d_vector, %rax
    push %rax
    push %rdi
    mov $32, %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _star_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else489
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl491(%rip), %rax
    push %rax
    mov 48(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov $4, %rcx
    call _std__p_make_d_closure
    add $32, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 24(%rsp), %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    add $24, %rsp
else489:
    mov 0(%rsp), %rax
    mov -2(%rax), %rax
    add $32, %rsp
    pop %r9
    cmp $0, %r9
    jge g949
    add $8, %rsp
    neg %r9
g949:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl494:
    push $0
    cmp $0, %rcx
    jl _std__p_error_nargs
    add $8, %rsp
    sub $0, %rcx
    cmp $0, %rcx
    jne dolist954
    pop %rax
    push $11
    neg %rax
    push %rax
    jmp fstart955
dolist954:
    push %rdi
    push %rax
    push %r8
    mov $0, %rdi
    mov $11, %rax
loop950:
    cmp %rdi, %rcx
    je end951
    mov 32(%rsp,%rdi,8), %r8
    push %rdi
    push %r8
    call _std__p_cons
    add $8, %rsp
    pop %rdi
    inc %rdi
    jmp loop950
end951:
    mov %rax, 32(%rsp)
    mov $0, %rdi
    mov %rcx, %r8
loop952:
    cmp $0, %rdi
    je end953
    mov 32(%rsp,%r8,8), %rax
    mov %rax, 32(%rsp,%rdi,8)
    dec %r8
    dec %rdi
    jmp loop952
end953:
    pop %r8
    pop %rax
    pop %rdi
fstart955:
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov list_d__gt_vector, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    pop %r9
    cmp $0, %r9
    jge g956
    add $8, %rsp
    neg %r9
g956:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl498:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov null_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else499
    mov 7(%rdi), %rax
    mov -2(%rax), %rax
    push %rax
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov car, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    call _std__p_object_d_setraw
    add $16, %rsp
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov cdr, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
else499:
    add $24, %rsp
    pop %r9
    cmp $0, %r9
    jge g957
    add $8, %rsp
    neg %r9
g957:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl495:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    mov 8(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov list_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else496
    push %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov length, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov type_d_uid_d_vector, %rax
    push %rax
    push %rdi
    mov $32, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov _star_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    call _std__p_object_d_new
    add $8, %rsp
    push %rax
    mov 0(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    lea lambda_d_decl498(%rip), %rax
    push %rax
    mov 8(%rsp), %rax
    push %rax
    mov $2, %rcx
    call _std__p_make_d_closure
    add $16, %rsp
    push %rax
    push %rdi
    mov 8(%rsp), %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov $0, %rax
    push %rax
    mov 32(%rsp), %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
    mov 8(%rsp), %rax
    mov -2(%rax), %rax
    add $32, %rsp
    jmp end497
else496:
    push %rdi
    lea str501(%rip), %rax
    add $1, %rax
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end497:
    add $8, %rsp
    pop %r9
    cmp $0, %r9
    jge g958
    add $8, %rsp
    neg %r9
g958:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl502:
    cmp $2, %rcx
    push $8
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    mov vector_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else503
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    push %rdi
    mov 40(%rsp), %rax
    call _std__p_object_d_length
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else505
    mov 16(%rsp), %rax
    push %rax
    mov 16(%rsp), %rax
    call _std__p_object_d_getraw
    add $8, %rsp
    jmp end506
else505:
    push %rdi
    lea str507(%rip), %rax
    add $1, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov error, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end506:
    jmp end504
else503:
    push %rdi
    lea str508(%rip), %rax
    add $1, %rax
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end504:
    pop %r9
    cmp $0, %r9
    jge g959
    add $8, %rsp
    neg %r9
g959:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl509:
    cmp $3, %rcx
    push $12
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 32(%rsp), %rax
    push %rax
    mov vector_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else510
    push %rdi
    mov 24(%rsp), %rax
    push %rax
    push %rdi
    mov 48(%rsp), %rax
    call _std__p_object_d_length
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else512
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov 24(%rsp), %rax
    call _std__p_object_d_setraw
    add $16, %rsp
    jmp end513
else512:
    push %rdi
    lea str514(%rip), %rax
    add $1, %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov error, %rax
    mov $3, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $24, %rsp
    pop %rdi
end513:
    jmp end511
else510:
    push %rdi
    lea str515(%rip), %rax
    add $1, %rax
    push %rax
    mov 40(%rsp), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end511:
    pop %r9
    cmp $0, %r9
    jge g960
    add $8, %rsp
    neg %r9
g960:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl516:
    cmp $1, %rcx
    push $4
    jne _std__p_error_nargs
    add $8, %rsp
    push %rdi
    mov 16(%rsp), %rax
    push %rax
    mov vector_qm_, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else517
    push %rdi
    mov 16(%rsp), %rax
    call _std__p_object_d_length
    push %rax
    mov $32, %rax
    push %rax
    mov quotient, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    jmp end518
else517:
    push %rdi
    lea str519(%rip), %rax
    add $1, %rax
    push %rax
    mov 24(%rsp), %rax
    push %rax
    mov error, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
end518:
    pop %r9
    cmp $0, %r9
    jge g961
    add $8, %rsp
    neg %r9
g961:
    push %r9
    ret
    .align 8
    .quad 0
    .byte 0
lambda_d_decl520:
    cmp $4, %rcx
    push $16
    jne _std__p_error_nargs
    add $8, %rsp
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    mov 32(%rsp), %rax
    push %rax
    mov $11, %rax
    call _std__p_cons
    add $8, %rsp
    push %rax
    push %rdi
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 24(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _lt_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    cmp $3, %rax
    je else521
    push %rdi
    push %rdi
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 40(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov vector_d_ref, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    push %rdi
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _eq_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov not, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    cmp $3, %rax
    je else523
    push %rdi
    push %rdi
    mov $128, %rax
    push %rax
    mov integer_d__gt_char, %rax
    mov $1, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $8, %rsp
    pop %rdi
    push %rax
    mov 16(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov write_d_char, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    push %rdi
    mov $4, %rax
    push %rax
    mov 48(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _plus_, %rax
    mov $2, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $16, %rsp
    pop %rdi
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov 32(%rsp), %rax
    mov -2(%rax), %rax
    push %rax
    mov _p_print_d_vector, %rax
    mov $4, %rcx
    mov %rax, %rdi
    mov -1(%rax), %rax
    call *%rax
    add $32, %rsp
    pop %rdi
else523:
else521:
    add $32, %rsp
    pop %r9
    cmp $0, %r9
    jge g962
    add $8, %rsp
    neg %r9
g962:
    push %r9
    ret
    .data 
    .globl globals_head, globals_tail, _p_stack_top, _p_stack_bottom, _p_heap_start, _p_heap_current, _p_heap_end, _p_alloc_ptr, _p_alloc_wanted, _p_allocd_pair, _p_allocd_obj, _p_allocd_size, _p_argc, _p_argv
_p_stack_top:
    .quad 0
_p_stack_bottom:
    .quad 0
_p_heap_start:
    .quad 0
_p_heap_current:
    .quad 0
_p_heap_end:
    .quad 0
_p_alloc_ptr:
    .quad 0
_p_alloc_wanted:
    .quad 0
_p_allocd_pair:
    .quad 0
_p_allocd_obj:
    .quad 0
_p_allocd_size:
    .quad 0
_p_argc:
    .quad 0
_p_argv:
    .quad 0
globals_head:
type_d_uid_d_procedure:
    .quad 0
type_d_uid_d_pair:
    .quad 0
type_d_uid_d_string:
    .quad 0
type_d_uid_d_symbol:
    .quad 0
type_d_uid_d_char:
    .quad 0
type_d_uid_d_vector:
    .quad 0
type_d_uid_d_closure:
    .quad 0
type_d_uid_d_machine_d_code:
    .quad 0
error:
    .quad 0
exit:
    .quad 0
print:
    .quad 0
pp:
    .quad 0
pretty_d_print:
    .quad 0
display:
    .quad 0
write:
    .quad 0
_p_port_d_print:
    .quad 0
write_d_char:
    .quad 0
newline:
    .quad 0
getchar:
    .quad 0
_p_print_d_string:
    .quad 0
_p_print_d_pair:
    .quad 0
boolean_qm_:
    .quad 0
equal_qm_:
    .quad 0
_p_error_nargs:
    .quad 0
not:
    .quad 0
number_qm_:
    .quad 0
_p_word_d_ceil:
    .quad 0
member:
    .quad 0
assoc:
    .quad 0
procedure_qm_:
    .quad 0
closure_qm_:
    .quad 0
apply:
    .quad 0
partial_d_sum:
    .quad 0
eq_qm_:
    .quad 0
eqv_qm_:
    .quad 0
_p_sym_d_table:
    .quad 0
symbol_qm_:
    .quad 0
symbol_d__gt_string:
    .quad 0
string_d__gt_symbol:
    .quad 0
unimap:
    .quad 0
multimap:
    .quad 0
map:
    .quad 0
for_d_each:
    .quad 0
eval:
    .quad 0
_p_gensym_d_count:
    .quad 0
gensym:
    .quad 0
verbose:
    .quad 0
_p_define_d_export_d_list:
    .quad 0
null_qm_:
    .quad 0
cons:
    .quad 0
car:
    .quad 0
cdr:
    .quad 0
caar:
    .quad 0
cadr:
    .quad 0
cdar:
    .quad 0
cddr:
    .quad 0
caaar:
    .quad 0
caadr:
    .quad 0
cadar:
    .quad 0
cdaar:
    .quad 0
caddr:
    .quad 0
cdadr:
    .quad 0
cddar:
    .quad 0
cdddr:
    .quad 0
caaaar:
    .quad 0
caaadr:
    .quad 0
caadar:
    .quad 0
cadaar:
    .quad 0
cdaaar:
    .quad 0
caaddr:
    .quad 0
cadadr:
    .quad 0
cdaadr:
    .quad 0
cdadar:
    .quad 0
cddaar:
    .quad 0
caddar:
    .quad 0
cadddr:
    .quad 0
cdaddr:
    .quad 0
cddadr:
    .quad 0
cdddar:
    .quad 0
cddddr:
    .quad 0
set_d_car_em_:
    .quad 0
set_d_cdr_em_:
    .quad 0
pair_qm_:
    .quad 0
list_qm_:
    .quad 0
length:
    .quad 0
list:
    .quad 0
_p_append:
    .quad 0
append:
    .quad 0
list_d_ref:
    .quad 0
list_d_set_em_:
    .quad 0
reverse:
    .quad 0
pair_d_equal_qm_:
    .quad 0
listrange:
    .quad 0
_plus_:
    .quad 0
_star_:
    .quad 0
_d_:
    .quad 0
quotient:
    .quad 0
modulo:
    .quad 0
_eq_:
    .quad 0
_lt_:
    .quad 0
_gt_:
    .quad 0
_lt__eq_:
    .quad 0
_gt__eq_:
    .quad 0
sum:
    .quad 0
ilog:
    .quad 0
pow:
    .quad 0
abs:
    .quad 0
integer_d__gt_string:
    .quad 0
number_d__gt_string:
    .quad 0
char_qm_:
    .quad 0
eof_d_object_qm_:
    .quad 0
integer_d__gt_char:
    .quad 0
char_d__gt_integer:
    .quad 0
char_eq__qm_:
    .quad 0
char_lt__eq__qm_:
    .quad 0
char_gt__eq__qm_:
    .quad 0
string_qm_:
    .quad 0
string_d_length:
    .quad 0
string_d_ref:
    .quad 0
string_d_set_em_:
    .quad 0
string:
    .quad 0
string_d_append:
    .quad 0
string_d_equal_qm_:
    .quad 0
substring:
    .quad 0
string_d__gt_number:
    .quad 0
with_d_input_d_from_d_process:
    .quad 0
open_d_pipe:
    .quad 0
c_test2:
    .quad 0
open_d_input_d_file:
    .quad 0
open_d_output_d_file:
    .quad 0
close_d_output_d_port:
    .quad 0
read_d_char:
    .quad 0
peek_d_char:
    .quad 0
_p_write_d_char:
    .quad 0
write_d_string:
    .quad 0
read_d_line:
    .quad 0
shell_d_command:
    .quad 0
_p_command_d_line_d_list:
    .quad 0
command_d_line:
    .quad 0
vector_qm_:
    .quad 0
make_d_vector:
    .quad 0
vector:
    .quad 0
list_d__gt_vector:
    .quad 0
vector_d_ref:
    .quad 0
vector_d_set_em_:
    .quad 0
vector_d_length:
    .quad 0
_p_print_d_vector:
    .quad 0
globals_tail:
    .align 8
    .quad 8
    .quad 42
str52:
    .ascii "eof     "
    .align 8
    .quad 8
    .quad 43
sym61:
    .ascii "quote   "
    .align 8
    .quad 16
    .quad 42
str66:
    .ascii "<procedure>     "
    .align 8
    .quad 40
    .quad 42
str73:
    .ascii "*** ERROR char-expected in write-char   "
    .align 8
    .quad 56
    .quad 42
str105:
    .ascii "Wrong number of arguments passed to procedure, got:     "
    .align 8
    .quad 24
    .quad 42
str108:
    .ascii ", expected at least:    "
    .align 8
    .quad 16
    .quad 42
str109:
    .ascii ", expected:     "
    .align 8
    .quad 40
    .quad 42
str125:
    .ascii "*** ERROR in member: list expected      "
    .align 8
    .quad 40
    .quad 42
str134:
    .ascii "*** ERROR in assoc: pair list expected  "
    .align 8
    .quad 40
    .quad 42
str139:
    .ascii "*** ERROR in assoc: list expected       "
    .align 8
    .quad 48
    .quad 42
str151:
    .ascii "Cannot apply procedure to non-list arguments    "
    .align 8
    .quad 40
    .quad 42
str154:
    .ascii "Cannot apply to a non-procedure         "
    .align 8
    .quad 32
    .quad 42
str183:
    .ascii "error in symbol->string, got:   "
    .align 8
    .quad 16
    .quad 42
str202:
    .ascii "Error 12982     "
    .align 8
    .quad 32
    .quad 42
str218:
    .ascii "****************** EVAL         "
    .align 8
    .quad 8
    .quad 42
str222:
    .ascii "g       "
    .align 8
    .quad 40
    .quad 42
str228:
    .ascii "*** ERROR pair expected in car got:     "
    .align 8
    .quad 40
    .quad 42
str232:
    .ascii "*** ERROR pair expected in car got:     "
    .align 8
    .quad 40
    .quad 42
str281:
    .ascii "*** ERROR in length: list expected      "
    .align 8
    .quad 40
    .quad 42
str290:
    .ascii "*** ERROR in append: List expected      "
    .align 8
    .quad 48
    .quad 42
str298:
    .ascii "*** ERROR in list-ref: index out of bounds      "
    .align 8
    .quad 40
    .quad 42
str303:
    .ascii "*** ERROR in list-ref: pair expected    "
    .align 8
    .quad 48
    .quad 42
str308:
    .ascii "*** ERROR in list-ref: index out of bounds      "
    .align 8
    .quad 40
    .quad 42
str313:
    .ascii "*** ERROR in list-ref: pair expected    "
    .align 8
    .quad 40
    .quad 42
str320:
    .ascii "*** ERROR in reverse: list expected     "
    .align 8
    .quad 8
    .quad 42
str369:
    .ascii "0       "
    .align 8
    .quad 8
    .quad 42
str372:
    .ascii "-       "
    .align 8
    .quad 56
    .quad 42
str396:
    .ascii "*** ERROR in string-length: Argument not a string       "
    .align 8
    .quad 48
    .quad 42
str400:
    .ascii "*** ERROR in string-ref: Argument not a string  "
    .align 8
    .quad 32
    .quad 42
str406:
    .ascii "*** ERROR in string-set!        "
    .align 8
    .quad 56
    .quad 42
str410:
    .ascii "*** ERROR in string, argument is not a character        "
    .align 8
    .quad 48
    .quad 42
str441:
    .ascii "*** Error in substring index out of range       "
    .align 8
    .quad 48
    .quad 42
str501:
    .ascii "*** ERROR in list->vector: Argument not a list  "
    .align 8
    .quad 48
    .quad 42
str507:
    .ascii "*** ERROR in vector-ref: index out of bounds    "
    .align 8
    .quad 48
    .quad 42
str508:
    .ascii "*** ERROR in vector-ref: Argument not a vector  "
    .align 8
    .quad 48
    .quad 42
str514:
    .ascii "*** ERROR in vector-set!: index out of bounds   "
    .align 8
    .quad 56
    .quad 42
str515:
    .ascii "*** ERROR in vector-set!: Argument not a vector         "
    .align 8
    .quad 56
    .quad 42
str519:
    .ascii "*** ERROR in vector-length: Argument not a vector       "
    .align 8
    .quad 24
    .quad 43
sym525:
    .ascii "type-uid-procedure      "
    .align 8
    .quad 16
    .quad 43
sym526:
    .ascii "type-uid-pair   "
    .align 8
    .quad 24
    .quad 43
sym527:
    .ascii "type-uid-string         "
    .align 8
    .quad 24
    .quad 43
sym528:
    .ascii "type-uid-symbol         "
    .align 8
    .quad 16
    .quad 43
sym529:
    .ascii "type-uid-char   "
    .align 8
    .quad 24
    .quad 43
sym530:
    .ascii "type-uid-vector         "
    .align 8
    .quad 24
    .quad 43
sym531:
    .ascii "type-uid-closure        "
    .align 8
    .quad 24
    .quad 43
sym532:
    .ascii "type-uid-machine-code   "
    .align 8
    .quad 8
    .quad 43
sym533:
    .ascii "error   "
    .align 8
    .quad 8
    .quad 43
sym534:
    .ascii "exit    "
    .align 8
    .quad 8
    .quad 43
sym535:
    .ascii "print   "
    .align 8
    .quad 8
    .quad 43
sym536:
    .ascii "pp      "
    .align 8
    .quad 16
    .quad 43
sym537:
    .ascii "pretty-print    "
    .align 8
    .quad 16
    .quad 43
sym538:
    .ascii "display         "
    .align 8
    .quad 8
    .quad 43
sym539:
    .ascii "write   "
    .align 8
    .quad 16
    .quad 43
sym540:
    .ascii "%port-print     "
    .align 8
    .quad 16
    .quad 43
sym541:
    .ascii "write-char      "
    .align 8
    .quad 16
    .quad 43
sym542:
    .ascii "newline         "
    .align 8
    .quad 16
    .quad 43
sym543:
    .ascii "getchar         "
    .align 8
    .quad 16
    .quad 43
sym544:
    .ascii "%print-string   "
    .align 8
    .quad 16
    .quad 43
sym545:
    .ascii "%print-pair     "
    .align 8
    .quad 16
    .quad 43
sym546:
    .ascii "boolean?        "
    .align 8
    .quad 8
    .quad 43
sym547:
    .ascii "equal?  "
    .align 8
    .quad 16
    .quad 43
sym548:
    .ascii "%error_nargs    "
    .align 8
    .quad 8
    .quad 43
sym549:
    .ascii "not     "
    .align 8
    .quad 16
    .quad 43
sym550:
    .ascii "number?         "
    .align 8
    .quad 16
    .quad 43
sym551:
    .ascii "%word-ceil      "
    .align 8
    .quad 8
    .quad 43
sym552:
    .ascii "member  "
    .align 8
    .quad 8
    .quad 43
sym553:
    .ascii "assoc   "
    .align 8
    .quad 16
    .quad 43
sym554:
    .ascii "procedure?      "
    .align 8
    .quad 16
    .quad 43
sym555:
    .ascii "closure?        "
    .align 8
    .quad 8
    .quad 43
sym556:
    .ascii "apply   "
    .align 8
    .quad 16
    .quad 43
sym557:
    .ascii "partial-sum     "
    .align 8
    .quad 8
    .quad 43
sym558:
    .ascii "eq?     "
    .align 8
    .quad 8
    .quad 43
sym559:
    .ascii "eqv?    "
    .align 8
    .quad 16
    .quad 43
sym560:
    .ascii "%sym-table      "
    .align 8
    .quad 16
    .quad 43
sym561:
    .ascii "symbol?         "
    .align 8
    .quad 16
    .quad 43
sym562:
    .ascii "symbol->string  "
    .align 8
    .quad 16
    .quad 43
sym563:
    .ascii "string->symbol  "
    .align 8
    .quad 8
    .quad 43
sym564:
    .ascii "unimap  "
    .align 8
    .quad 16
    .quad 43
sym565:
    .ascii "multimap        "
    .align 8
    .quad 8
    .quad 43
sym566:
    .ascii "map     "
    .align 8
    .quad 16
    .quad 43
sym567:
    .ascii "for-each        "
    .align 8
    .quad 8
    .quad 43
sym568:
    .ascii "eval    "
    .align 8
    .quad 16
    .quad 43
sym569:
    .ascii "%gensym-count   "
    .align 8
    .quad 8
    .quad 43
sym570:
    .ascii "gensym  "
    .align 8
    .quad 16
    .quad 43
sym571:
    .ascii "verbose         "
    .align 8
    .quad 24
    .quad 43
sym572:
    .ascii "%define-export-list     "
    .align 8
    .quad 8
    .quad 43
sym573:
    .ascii "null?   "
    .align 8
    .quad 8
    .quad 43
sym574:
    .ascii "cons    "
    .align 8
    .quad 8
    .quad 43
sym575:
    .ascii "car     "
    .align 8
    .quad 8
    .quad 43
sym576:
    .ascii "cdr     "
    .align 8
    .quad 8
    .quad 43
sym577:
    .ascii "caar    "
    .align 8
    .quad 8
    .quad 43
sym578:
    .ascii "cadr    "
    .align 8
    .quad 8
    .quad 43
sym579:
    .ascii "cdar    "
    .align 8
    .quad 8
    .quad 43
sym580:
    .ascii "cddr    "
    .align 8
    .quad 8
    .quad 43
sym581:
    .ascii "caaar   "
    .align 8
    .quad 8
    .quad 43
sym582:
    .ascii "caadr   "
    .align 8
    .quad 8
    .quad 43
sym583:
    .ascii "cadar   "
    .align 8
    .quad 8
    .quad 43
sym584:
    .ascii "cdaar   "
    .align 8
    .quad 8
    .quad 43
sym585:
    .ascii "caddr   "
    .align 8
    .quad 8
    .quad 43
sym586:
    .ascii "cdadr   "
    .align 8
    .quad 8
    .quad 43
sym587:
    .ascii "cddar   "
    .align 8
    .quad 8
    .quad 43
sym588:
    .ascii "cdddr   "
    .align 8
    .quad 8
    .quad 43
sym589:
    .ascii "caaaar  "
    .align 8
    .quad 8
    .quad 43
sym590:
    .ascii "caaadr  "
    .align 8
    .quad 8
    .quad 43
sym591:
    .ascii "caadar  "
    .align 8
    .quad 8
    .quad 43
sym592:
    .ascii "cadaar  "
    .align 8
    .quad 8
    .quad 43
sym593:
    .ascii "cdaaar  "
    .align 8
    .quad 8
    .quad 43
sym594:
    .ascii "caaddr  "
    .align 8
    .quad 8
    .quad 43
sym595:
    .ascii "cadadr  "
    .align 8
    .quad 8
    .quad 43
sym596:
    .ascii "cdaadr  "
    .align 8
    .quad 8
    .quad 43
sym597:
    .ascii "cdadar  "
    .align 8
    .quad 8
    .quad 43
sym598:
    .ascii "cddaar  "
    .align 8
    .quad 8
    .quad 43
sym599:
    .ascii "caddar  "
    .align 8
    .quad 8
    .quad 43
sym600:
    .ascii "cadddr  "
    .align 8
    .quad 8
    .quad 43
sym601:
    .ascii "cdaddr  "
    .align 8
    .quad 8
    .quad 43
sym602:
    .ascii "cddadr  "
    .align 8
    .quad 8
    .quad 43
sym603:
    .ascii "cdddar  "
    .align 8
    .quad 8
    .quad 43
sym604:
    .ascii "cddddr  "
    .align 8
    .quad 16
    .quad 43
sym605:
    .ascii "set-car!        "
    .align 8
    .quad 16
    .quad 43
sym606:
    .ascii "set-cdr!        "
    .align 8
    .quad 8
    .quad 43
sym607:
    .ascii "pair?   "
    .align 8
    .quad 8
    .quad 43
sym608:
    .ascii "list?   "
    .align 8
    .quad 8
    .quad 43
sym609:
    .ascii "length  "
    .align 8
    .quad 8
    .quad 43
sym610:
    .ascii "list    "
    .align 8
    .quad 16
    .quad 43
sym611:
    .ascii "%append         "
    .align 8
    .quad 8
    .quad 43
sym612:
    .ascii "append  "
    .align 8
    .quad 16
    .quad 43
sym613:
    .ascii "list-ref        "
    .align 8
    .quad 16
    .quad 43
sym614:
    .ascii "list-set!       "
    .align 8
    .quad 16
    .quad 43
sym615:
    .ascii "reverse         "
    .align 8
    .quad 16
    .quad 43
sym616:
    .ascii "pair-equal?     "
    .align 8
    .quad 16
    .quad 43
sym617:
    .ascii "listrange       "
    .align 8
    .quad 8
    .quad 43
sym618:
    .ascii "+       "
    .align 8
    .quad 8
    .quad 43
sym619:
    .ascii "*       "
    .align 8
    .quad 8
    .quad 43
sym620:
    .ascii "-       "
    .align 8
    .quad 16
    .quad 43
sym621:
    .ascii "quotient        "
    .align 8
    .quad 8
    .quad 43
sym622:
    .ascii "modulo  "
    .align 8
    .quad 8
    .quad 43
sym623:
    .ascii "=       "
    .align 8
    .quad 8
    .quad 43
sym624:
    .ascii "<       "
    .align 8
    .quad 8
    .quad 43
sym625:
    .ascii ">       "
    .align 8
    .quad 8
    .quad 43
sym626:
    .ascii "<=      "
    .align 8
    .quad 8
    .quad 43
sym627:
    .ascii ">=      "
    .align 8
    .quad 8
    .quad 43
sym628:
    .ascii "sum     "
    .align 8
    .quad 8
    .quad 43
sym629:
    .ascii "ilog    "
    .align 8
    .quad 8
    .quad 43
sym630:
    .ascii "pow     "
    .align 8
    .quad 8
    .quad 43
sym631:
    .ascii "abs     "
    .align 8
    .quad 24
    .quad 43
sym632:
    .ascii "integer->string         "
    .align 8
    .quad 16
    .quad 43
sym633:
    .ascii "number->string  "
    .align 8
    .quad 8
    .quad 43
sym634:
    .ascii "char?   "
    .align 8
    .quad 16
    .quad 43
sym635:
    .ascii "eof-object?     "
    .align 8
    .quad 16
    .quad 43
sym636:
    .ascii "integer->char   "
    .align 8
    .quad 16
    .quad 43
sym637:
    .ascii "char->integer   "
    .align 8
    .quad 8
    .quad 43
sym638:
    .ascii "char=?  "
    .align 8
    .quad 16
    .quad 43
sym639:
    .ascii "char<=?         "
    .align 8
    .quad 16
    .quad 43
sym640:
    .ascii "char>=?         "
    .align 8
    .quad 16
    .quad 43
sym641:
    .ascii "string?         "
    .align 8
    .quad 16
    .quad 43
sym642:
    .ascii "string-length   "
    .align 8
    .quad 16
    .quad 43
sym643:
    .ascii "string-ref      "
    .align 8
    .quad 16
    .quad 43
sym644:
    .ascii "string-set!     "
    .align 8
    .quad 8
    .quad 43
sym645:
    .ascii "string  "
    .align 8
    .quad 16
    .quad 43
sym646:
    .ascii "string-append   "
    .align 8
    .quad 16
    .quad 43
sym647:
    .ascii "string-equal?   "
    .align 8
    .quad 16
    .quad 43
sym648:
    .ascii "substring       "
    .align 8
    .quad 16
    .quad 43
sym649:
    .ascii "string->number  "
    .align 8
    .quad 32
    .quad 43
sym650:
    .ascii "with-input-from-process         "
    .align 8
    .quad 16
    .quad 43
sym651:
    .ascii "open-pipe       "
    .align 8
    .quad 16
    .quad 43
sym652:
    .ascii "c_test2         "
    .align 8
    .quad 24
    .quad 43
sym653:
    .ascii "open-input-file         "
    .align 8
    .quad 24
    .quad 43
sym654:
    .ascii "open-output-file        "
    .align 8
    .quad 24
    .quad 43
sym655:
    .ascii "close-output-port       "
    .align 8
    .quad 16
    .quad 43
sym656:
    .ascii "read-char       "
    .align 8
    .quad 16
    .quad 43
sym657:
    .ascii "peek-char       "
    .align 8
    .quad 16
    .quad 43
sym658:
    .ascii "%write-char     "
    .align 8
    .quad 16
    .quad 43
sym659:
    .ascii "write-string    "
    .align 8
    .quad 16
    .quad 43
sym660:
    .ascii "read-line       "
    .align 8
    .quad 16
    .quad 43
sym661:
    .ascii "shell-command   "
    .align 8
    .quad 24
    .quad 43
sym662:
    .ascii "%command-line-list      "
    .align 8
    .quad 16
    .quad 43
sym663:
    .ascii "command-line    "
    .align 8
    .quad 16
    .quad 43
sym664:
    .ascii "vector?         "
    .align 8
    .quad 16
    .quad 43
sym665:
    .ascii "make-vector     "
    .align 8
    .quad 8
    .quad 43
sym666:
    .ascii "vector  "
    .align 8
    .quad 16
    .quad 43
sym667:
    .ascii "list->vector    "
    .align 8
    .quad 16
    .quad 43
sym668:
    .ascii "vector-ref      "
    .align 8
    .quad 16
    .quad 43
sym669:
    .ascii "vector-set!     "
    .align 8
    .quad 16
    .quad 43
sym670:
    .ascii "vector-length   "
    .align 8
    .quad 16
    .quad 43
sym671:
    .ascii "%print-vector   "
    .align 8
    .quad 24
    .quad 42
str672:
    .ascii "test/140-if.scm         "
    .align 8
    .quad 16
    .quad 42
str673:
    .ascii "(define x #f)   "
    


// std_lib 4

.text
_std__p_print:
    push %rbx
    push %rdx
    push %rax
    push %rcx
    cmp $7, %rax
    je true23
    cmp $3, %rax
    je false24
    sar $2, %rax
    mov $0, %rcx
    test %rax, %rax
    jns fill22
    push %rax
    mov $45, %rax
    call _std__p_putchar_rax
    pop %rax
    neg %rax
fill22:
    xor %rdx, %rdx
    mov $10, %rbx
    div %rbx
    add $48, %rdx
    push %rdx
    inc %rcx
    cmp $0, %rax
    jnz fill22
loop25:
    pop %rax
    call _std__p_putchar_rax
    dec %rcx
    cmp $0, %rcx
    jnz loop25
    jmp end26
true23:
    mov $35, %rax
    call _std__p_putchar_rax
    mov $116, %rax
    call _std__p_putchar_rax
    jmp end26
false24:
    mov $35, %rax
    call _std__p_putchar_rax
    mov $102, %rax
    call _std__p_putchar_rax
end26:
    pop %rcx
    pop %rax
    pop %rdx
    pop %rbx
    ret
_std__p_putchar:
    shr $2, %rax
    call _std__p_putchar_rax
    ret
_std__p_putchar_rax:
    push %rax
    push %r11
    push %rbp
    push %rsi
    push %rdi
    push %rdx
    push %rcx
    push %rbx
    lea 56(%rsp), %rsi
    mov $1, %rdx
    mov $1, %rdi
    mov $1, %rax
    syscall
    pop %rbx
    pop %rcx
    pop %rdx
    pop %rdi
    pop %rsi
    pop %rbp
    pop %r11
    pop %rax
    ret
_std__p_getchar:
    push %r11
    push %rbp
    push %rsi
    push %rdi
    push %rdx
    push %rcx
    push %rbx
    push $0
    lea 0(%rsp), %rsi
    mov $1, %rdx
    mov $0, %rdi
    mov $0, %rax
    syscall
    cmp $1, %rax
    jne getchar1
    pop %rax
    shl $2, %rax
    pop %rbx
    pop %rcx
    pop %rdx
    pop %rdi
    pop %rsi
    pop %rbp
    pop %r11
    ret
getchar1:
    pop %rax
    mov $-1, %rax
    pop %rbx
    pop %rcx
    pop %rdx
    pop %rdi
    pop %rsi
    pop %rbp
    pop %r11
    ret
_std__p_exit:
    mov %rax, %rbx
asd:
    movl $1, %eax
    int $128
    ret
mmap_alloc:
    push %r11
    push %rbp
    push %rsi
    push %rdi
    push %rdx
    push %rcx
    push %rbx
    mov $0, %rdi
    mov 64(%rsp), %rsi
    mov $7, %rdx
    mov $34, %rcx
    mov $-1, %r8
    mov $0, %r9
    mov %rcx, %r10
    mov $9, %rax
    syscall
    pop %rbx
    pop %rcx
    pop %rdx
    pop %rdi
    pop %rsi
    pop %rbp
    pop %r11
    ret $8
_std__p_gc_d_routine:
    push %rax
    mov %rsp, %rax
    mov %rsp, _p_stack_bottom
    mov %rbx, _p_alloc_ptr
    mov %rcx, _p_alloc_wanted
    and $-16, %rsp
    sub $8, %rsp
    push %rax
    call _gc_routine
    pop %rsp
    mov _p_alloc_ptr, %rbx
    pop %rax
    ret
_std__p_pair_qm_:
    and $3, %rax
    cmp $2, %rax
    jne ret_d_false7
    mov $7, %rax
    jmp end8
ret_d_false7:
    mov $3, %rax
end8:
    ret
_std__p_cons:
    push %rcx
    mov $32, %rcx
    add %rbx, %rcx
    sub _p_heap_current, %rcx
    cmp $134217728, %rcx
    jl else11
    mov $32, %rcx
    call _std__p_gc_d_routine
else11:
    mov _p_allocd_pair, %rcx
    inc %rcx
    mov %rcx, _p_allocd_pair
    pop %rcx
    movq $16, 0(%rbx)
    movq $2, 8(%rbx)
    mov %rax, 24(%rbx)
    mov 8(%rsp), %rax
    mov %rax, 16(%rbx)
    mov %rbx, %rax
    add $18, %rax
    add $32, %rbx
    ret
_std__p_object_qm_:
    push %rdx
    mov %rax, %rdx
    and $3, %rax
    cmp $1, %rax
    jne ret_false13
    mov $7, %rax
    jmp end14
ret_false13:
    mov $3, %rax
end14:
    pop %rdx
    ret
_std__p_object_d_new:
    push %rcx
    shr $2, %rax
    mov %rax, %rcx
    add $16, %rcx
    push %rcx
    add %rbx, %rcx
    sub _p_heap_current, %rcx
    cmp $134217728, %rcx
    jl else12
    pop %rcx
    push %rcx
    call _std__p_gc_d_routine
else12:
    pop %rcx
    add _p_allocd_size, %rcx
    mov %rcx, _p_allocd_size
    mov _p_allocd_obj, %rcx
    inc %rcx
    mov %rcx, _p_allocd_obj
    mov %rax, 0(%rbx)
    mov 16(%rsp), %rcx
    shr $2, %rcx
    mov %rcx, 8(%rbx)
    mov %rbx, %rcx
    add $16, %rbx
    add %rax, %rbx
    mov %rcx, %rax
    add $17, %rax
    pop %rcx
    ret
_std__p_object_d_getraw:
    push %rcx
    mov 16(%rsp), %rcx
    sal $1, %rax
    mov -1(%rcx,%rax), %rax
    pop %rcx
    ret
_std__p_object_d_setraw:
    push %rcx
    push %rdx
    mov 24(%rsp), %rcx
    mov 32(%rsp), %rdx
    sal $1, %rcx
    mov %rax, -1(%rdx,%rcx)
    pop %rdx
    pop %rcx
    ret
_std__p_object_d_getq:
    push %rcx
    mov 16(%rsp), %rcx
    sal $1, %rax
    mov -1(%rcx,%rax), %rax
    sal $2, %rax
    pop %rcx
    ret
_std__p_object_d_setq:
    push %rcx
    push %rdx
    mov 24(%rsp), %rcx
    mov 32(%rsp), %rdx
    sar $2, %rax
    sal $1, %rcx
    mov %rax, -1(%rdx,%rcx)
    pop %rdx
    pop %rcx
    ret
_std__p_object_d_getb:
    push %rcx
    push %rbx
    mov 24(%rsp), %rcx
    mov %rax, %rbx
    sar $2, %rbx
    xor %rax, %rax
    movb -1(%rcx,%rbx), %al
    pop %rbx
    pop %rcx
    shl $2, %rax
    ret
_std__p_object_d_setb:
    push %rcx
    push %rdx
    mov 32(%rsp), %rcx
    mov 24(%rsp), %rdx
    sar $2, %rax
    sar $2, %rdx
    movb %al, -1(%rcx,%rdx)
    pop %rdx
    pop %rcx
    ret
_std__p_object_d_eqv_qm_:
    push %rbx
    push %rcx
    push %rdx
    push %rbp
    mov 40(%rsp), %rcx
    mov -17(%rax), %rdx
    mov -17(%rcx), %rbp
    cmp %rdx, %rbp
    jne ret_false16
    mov $0, %rbp
    mov %rax, %rbx
loop15:
    mov -1(%rcx,%rbp), %al
    cmp %al, -1(%rbx,%rbp)
    jne ret_false16
    inc %rbp
    cmp %rbp, %rdx
    jne loop15
    mov $7, %rax
    jmp end17
ret_false16:
    mov $3, %rax
end17:
    pop %rbp
    pop %rdx
    pop %rcx
    pop %rbx
    ret
_std__p_object_d_eqz_qm_:
    push %rbx
    push %rcx
    push %rdx
    push %rbp
    mov 40(%rsp), %rcx
    mov -17(%rax), %rdx
    mov -17(%rcx), %rbp
    cmp %rdx, %rbp
    jne ret_false19
    mov $0, %rbp
    mov %rax, %rbx
loop18:
    mov -1(%rcx,%rbp), %al
    cmp %al, -1(%rbx,%rbp)
    jne ret_false19
    cmp $0, %al
    je ret_true20
    inc %rbp
    cmp %rbp, %rdx
    jne loop18
ret_true20:
    mov $7, %rax
    jmp end21
ret_false19:
    mov $3, %rax
end21:
    pop %rbp
    pop %rdx
    pop %rcx
    pop %rbx
    ret
_std__p_object_d_type:
    mov -9(%rax), %rax
    shl $2, %rax
    ret
_std__p_object_d_length:
    mov -17(%rax), %rax
    shl $2, %rax
    ret
_std__p_object_d_address:
    shl $2, %rax
    ret
_std__p_number_qm_:
    push %rdx
    mov %rax, %rdx
    and $3, %rax
    cmp $0, %rax
    jne ret_false9
    mov $7, %rax
    jmp end10
ret_false9:
    mov $3, %rax
end10:
    pop %rdx
    ret
_std__p_apply:
    push %r9
    push %rcx
    push %rdx
    xor %rcx, %rcx
    mov 32(%rsp), %r9
push_d_loop2:
    dec %rax
    mov $11, %rdx
    cmp %rdx, %rax
    jz call3
    push -1(%rax)
    mov 7(%rax), %rax
    inc %rcx
    jmp push_d_loop2
call3:
    call *%r9
    imul $8, %rcx
    add %rcx, %rsp
    pop %rdx
    pop %rcx
    pop %r9
    ret
_std__p_apply_d_closure:
    push %rcx
    push $27
    xor %rcx, %rcx
    mov 24(%rsp), %rdi
push_d_loop4:
    cmp $11, %rax
    jz call5
    push -2(%rax)
    mov 6(%rax), %rax
    inc %rcx
    jmp push_d_loop4
call5:
    mov -1(%rdi), %rax
    call *%rax
pop_d_loop6:
    pop %rcx
    cmp $27, %rcx
    jne pop_d_loop6
    pop %rcx
    ret
_std__p_call_d_machine_d_code:
    dec %rax
    call *%rax
    ret
_std__p_error_nargs:
    shl $2, %rcx
    push %rcx
    mov _p_error_nargs, %rax
    mov $2, %rcx
    mov -1(%rax), %rax
    call *%rax
    pop %rcx
    ret
_std__p_make_d_closure:
    shl $5, %rcx
    mov %rcx, %rax
    push %rcx
    push $384
    call _std__p_object_d_new
    pop %rcx
    pop %rcx
    shr $5, %rcx
    push %rdx
    push %rdi
    xor %rdi, %rdi
loop0:
    cmp $0, %rcx
    jz end1
    dec %rcx
    mov 24(%rsp,%rdi,8), %rdx
    mov %rdx, -1(%rax,%rcx,8)
    inc %rdi
    jmp loop0
end1:
    pop %rdi
    pop %rdx
    ret
