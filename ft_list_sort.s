global _ft_list_sort

;r10 start
;rdi current
;r11 next
_ft_list_sort:
                ; mov     rdi, 8
                ; mov     rax, 9
                ; jmp     _exit_sort
                mov     r13, 0

                cmp     byte [rdi], 0
                je      _exit_sort


                mov     r10, [rdi]

                mov     rdi, [rdi]

                jmp     _check

_check:     
                inc     r13
                cmp     r13, 100
                je      _exit    
                mov     r11, [rdi + 8]
                cmp     r11, 0
                je      _exit_sort
                push    rdi
                push    rsi
                mov     rdx, rsi
                mov     rdi, [rdi]
                mov     rsi, [r11]
                call    rdx
                pop     rsi
                pop     rdi
                cmp     rax, 0
                jg      _swap
                mov     rdi, r11
                jmp     _check

_swap:
                mov		r8, [rdi]   ;a data
	            mov		r9, [r11]   ;b data
	            mov		[rdi], r9	
	            mov		[r11], r8
                mov     rdi, r10
                jmp     _check

_exit_sort:
                ; mov     rax, r13
                ret

_exit:
                mov     rax, 5
                ret