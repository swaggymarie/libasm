global ft_write
extern __errno_location

ft_write:
		cmp 	rdx, 0
		jle	end
		;cmp 	rsi, 0
		;je		_end
		;cmp 	rdi, 0
		;jle		_end
	       	
		mov	rax,1
		syscall
	        jnc     end
	        push    rax
	        call    __errno_location
	        pop     qword [rax]
		mov     rax, -1

end:
            ret
