global ft_read
extern __errno_location

ft_read:
            mov		rax,3
	        syscall
	        jnc     _end
	        push    rax
	        call    __errno_location
	        pop     qword [rax]
            mov     rax, -1

_end:
            ret
