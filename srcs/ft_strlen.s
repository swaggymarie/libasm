
global      ft_strlen
            
ft_strlen:
        mov     rax, -1
        cmp     rdi, 0x00
        je      _exit
        je      _loop

_loop:
        inc     rax
        cmp     byte[rdi + rax], 0
        jne     _loop

_exit:
        ret
