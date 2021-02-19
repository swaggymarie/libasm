global ft_list_sort

;r10 start
;rdi current
;r11 next
ft_list_sort:
		cmp	rdi, 0
		je	exit_sort
		cmp	rsi, 0
		je	exit_sort
		mov	r10, [rdi]
               	mov     rdi, [rdi]
                jmp     check

test:
		inc	r13
		mov 	rdi, [rdi + 8]
		cmp	rdi, 0
		je	exit_sort
		jmp	test

check:
                mov     r11, [rdi + 8]
                cmp     r11, 0
                je      exit_sort
                push	rdi
		push	rsi
		push	r11
		mov	r13, rsi
                mov     rdi, [rdi]
                mov     rsi, [r11]
                call    r13
		pop	r11
		pop	rsi
                pop     rdi
                cmp     eax, 0
		jg	swap
                mov     rdi, r11
                jmp     check

swap:
                mov	r8, [rdi]   ;a data
	        mov	r9, [r11]   ;b data
	        mov	[rdi], r9	
	        mov	[r11], r8
                mov     rdi, r10
                jmp     check

exit_sort:
		ret
