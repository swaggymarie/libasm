global _ft_list_push_front
extern _malloc
extern _ft_create_elem
_ft_list_push_front:
                        push    rbx
                        push    rdi
                        push    rsi
                        mov     rdi, 16
                        call    _malloc
                        pop     rsi
                        pop     rdi  
                        cmp		rax, 0               
			            jz		_end
                        mov     [rax], rsi
                        mov     r8, [rdi]
                        mov     [rax + 8], r8
                        mov     [rdi], rax
_end:
                pop rbx
                ret