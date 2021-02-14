global _ft_write
extern ___error

_ft_write:
			; cmp 	rdx, 0
			; jle		_end
			; cmp 	rsi, 0
			; je		_end
			; cmp 	rdi, 0
			; jle		_end
            mov		rax, 0x2000004
	        syscall
	        jnc     _end
	        push    rax
	        call    ___error
	        pop     qword [rax]
            mov     rax, -1

_end:
            ret