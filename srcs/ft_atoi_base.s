global ft_atoi_base
extern  ft_strlen

;r10 neg
;r11 nb
;r12 base
;r13 rsi
ft_atoi_base:
                mov	r10, 1
                mov	r11, 0
                push	rdi
                push	rsi
                mov 	rdi,rsi
                call	ft_strlen
                pop 	rsi
                pop 	rdi
                cmp	rax, 2
                jl	exit
                mov	r13, rsi
                mov	r12, rax
                jmp	base
                
base:
                mov	r9b, byte[rsi]
                cmp	r9b, 0
                je	whitespace
                cmp	r9b, 9
                je	exit
                cmp	r9b, 10
                je	exit
                cmp	r9b, 11
                je	exit
                cmp	r9b, 12
                je	exit
                cmp	r9b, 13
                je	exit
                cmp	r9b, 32
                je	exit
                cmp	r9b, '-'
                je	exit
                cmp	r9b, '+'
                je	exit
                inc	rsi
                mov	r15, rsi
                jmp	double_check

double_check:
                cmp	byte[r15], 0
                je	base
                cmp	r9b, [r15]
                je	exit
                inc	r15
                jmp	double_check

whitespace:
                mov	r8b, byte [rdi]
                cmp	r8b, 9
                je	incr
                cmp	r8b, 10
                je	incr
                cmp	r8b, 11
                je	incr
                cmp	r8b, 12
                je	incr
                cmp	r8b, 13
                je	incr
                cmp	r8b, 32
                je	incr
                cmp	r8b, 0
                je	exit
                jmp	sign
incr:
                inc	rdi
                jmp	whitespace

sign:
                cmp	r8b, '-'
                je	neg
                cmp	r8b, '+'
                jne	number_init
                inc	rdi
                mov	r8b, byte [rdi]
                jmp	sign

neg:
                neg	r10
                inc	rdi
                mov	r8b, byte [rdi]
                jmp	sign

number_init:
                cmp	r8b, 0
                je	return
                mov	r9, 0
                jmp	nb_base
nb_base:
                cmp	r9, r12
                je	return 
                cmp	byte [r13 + r9], r8b ; maybe enlever r13
                je	nb
                inc	r9
                jmp	nb_base

nb:
                imul	r11, r12
                add	r11, r9
                inc	rdi
                mov	r8b, byte [rdi]
                jmp	number_init

exit:
                mov	rax, 0
                ret
return:
                mov     rax, r11
                imul    rax, r10
                ret  
