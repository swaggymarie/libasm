global ft_list_push_front
extern malloc

ft_list_push_front:
                    push    rbx
                    push    rdi
                    push    rsi
                    mov     rdi, 16
                    call    malloc
                    pop     rsi
                    pop     rdi  
                    cmp		rax, 0               
			        jz		_end
                    mov     [rax], rsi
                    mov     r8, [rdi]
                    mov     [rax + 8], r8
                    mov     [rdi], rax
_end:
                    pop     rbx
                    ret
