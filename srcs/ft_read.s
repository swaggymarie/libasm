global ft_read
extern __errno_location

ft_read:
	cmp	rdx, 0
	jle	end
	mov	rax, 0
	syscall
	jnc	end
	push	rax
	call    __errno_location
	pop     qword [rax]
	mov     rax, -1

end:
	ret
