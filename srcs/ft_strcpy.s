global ft_strcpy

ft_strcpy:
            mov     rax, 0
            cmp     rdi, 0x00
            je      _is_null
            cmp     rsi, 0x00
            je      _is_null
            jmp     _looop

_looop:     
            cmp     byte [rsi + rax], 0
            je      _exit
            mov     r8b, [rsi + rax]
            mov     [rdi + rax], r8b
            inc     rax
            jmp     _looop

_exit:
            mov     r8b, 0
            mov     [rdi + rax], r8b
            mov     rax, rdi
            ret

_is_null:
            mov     rax, -1
            ret