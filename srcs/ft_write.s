global ft_write
extern __errno_location

ft_write:
			cmp 	rdx, 0
			jle		_end
			;cmp 	rsi, 0
			;je		_end
			;cmp 	rdi, 0
			;jle		_end
	       	mov		rax,4
		syscall
	        jnc     _end
	        push    rax
	        call    __errno_location
	        pop     qword [rax]
		mov     eax, -1

_end:
            ret
