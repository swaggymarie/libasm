global _ft_list_sort

;r10 start
;rdi current
;r11 next
_ft_list_sort:
                cmp     rdi, 0
                je      _exit_error
                cmp     dword [rdi], 0
                je      _exit_error
                cmp     rsi, 0
                je      _exit_sort
                mov     r10, [rdi] ;save first node in r10
                mov     rdi, [rdi]
                jmp     _check

_check:        
                mov     r11, [rdi + 8]
                cmp     r11, 0
                je      _exit_sort
                push    rdi
                push    rsi
                mov     rdi, [rdi]
                mov     rdx, rsi
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
                ret

_exit_error:
                mov rax, 7
                ret