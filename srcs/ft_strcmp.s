global ft_strcmp

ft_strcmp:
            cmp     rdi, 0x00
            je      _is_null
            cmp     rsi, 0x00
            je      _is_null
            mov     r8b, byte [rdi]
            mov     r9b, byte [rsi]
            mov     rax, 0
            cmp     r8b, 0
            je      _exitcmp
            cmp     r9b, 0
            je      _exitcmp
            cmp     r8b, r9b
            jne     _exitcmp
            inc     rsi
            inc     rdi
            jmp     ft_strcmp

_exitcmp:

            movzx   rax, r8b
            movzx   r8, r9b
            sub     rax, r8 
            ret

_is_null:
            ret