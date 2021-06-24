global ft_list_size

ft_list_size:
            push    rdi
            mov     rax, 0
            jmp     _loop

_loop:
            cmp     rdi, 0
            je      _exit
            inc     rax
            mov     rdi, [rdi + 8]
            jmp     _loop

_exit:
            pop     rdi
            ret
