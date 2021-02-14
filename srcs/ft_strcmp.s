global _ft_strcmp

_ft_strcmp:
            mov r8b, byte [rdi]
            mov r9b, byte [rsi]
            mov rax, 0
            cmp r8b, 0
            je _exitcmp
            cmp r9b, 0
            je _exitcmp
            cmp r8b, r9b
            jne _exitcmp
            inc rsi
            inc rdi
            jmp _ft_strcmp

_exitcmp:

            movzx   rax, r8b
            movzx   r8, r9b
            sub     rax, r8 
            ret
