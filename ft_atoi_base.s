global _ft_atoi_base
extern  _ft_strlen

;r10 neg
;r11 nb
;r12 base
;r13 rsi
_ft_atoi_base:
                mov r10, 1
                mov r11, 0
                push rdi
                push rsi
                mov  rdi,rsi
                call _ft_strlen
                pop  rsi
                pop  rdi
                cmp rax, 2
                jl _exit
                mov  r13, rsi
                mov  r12, rax
                jmp _base
                
_base:
                mov r9b, byte[rsi]
                cmp r9b, 0
                je  _whitespace
                cmp r9b, 9
                je  _exit
                cmp r9b, 10
                je  _exit
                cmp r9b, 11
                je  _exit
                cmp r9b, 12
                je  _exit
                cmp r9b, 13
                je  _exit
                cmp r9b, 32
                je  _exit
                cmp r9b, '-'
                je  _exit
                cmp r9b, '+'
                je  _exit
                inc rsi
                mov r15, rsi
                jmp _double_check

_double_check:
                cmp byte[r15], 0
                je  _base
                cmp r9b, [r15]
                je  _exit
                inc r15
                jmp _double_check

_whitespace:
                mov r8b, byte [rdi]
                cmp r8b, 9
                je  _incr
                cmp r8b, 10
                je  _incr
                cmp r8b, 11
                je  _incr
                cmp r8b, 12
                je  _incr
                cmp r8b, 13
                je  _incr
                cmp r8b, 32
                je  _incr
                cmp r8b, 0
                je  _exit
                jmp _sign
_incr:
                inc rdi
                jmp _whitespace

_sign:
                cmp r8b, '-'
                je  _neg
                cmp r8b, '+'
                jne _number_init
                inc rdi
                mov r8b, byte [rdi]
                jmp _sign
                

_neg:
                neg r10
                inc rdi
                mov r8b, byte [rdi]
                jmp _sign

_number_init:
                cmp r8b, 0
                je  _return
                mov r9, 0
                jmp _nb_base
_nb_base:    
                cmp r9, r12
                je  _return 
                cmp byte [r13 + r9], r8b ; maybe enlever r13
                je  _nb
                inc r9
                jmp _nb_base

_nb:
                imul r11, r12
                add r11, r9
                inc rdi
                mov r8b, byte [rdi]
                jmp _number_init

_exit:
                mov rax, 0
                ret
_return:
                mov     rax, r11
                imul    rax, r10
                ret  