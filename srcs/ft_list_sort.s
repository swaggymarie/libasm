global ft_list_sort

;r10 start
;rdi current
;r11 next
ft_list_sort:
                ;cmp     rdi, 0
                ;je      exit_sort
                ;cmp     rsi, 0
                ;je      exit_sort
               	mov     rdi, [rdi]
                mov     r10, rdi ;save first node in r10
		mov	r13, 0
                mov     rdx, rsi
                jmp     check

test:
		inc	r13
		mov 	rdi, [rdi + 8]
		cmp	rdi, 0
		je	exit
		jmp	test

check: 
		;inc 	r13
		;cmp	r13, 1
		;je	exit
                mov     r11, [rdi + 8]
                cmp     r11, 0
                je      exit
                push	rdi
		push	rdx
		push	r11
                mov     rdi, [rdi]
                mov     rsi, [r11]
                call    rdx
		pop	r11
		pop	rdx
                pop     rdi
                cmp     rax, 0
                jg      swap
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

exit:
		mov rax, r13
		ret
