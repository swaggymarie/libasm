global _ft_strcpy
extern ___error
_ft_strcpy:
            mov rax, 0
            jmp _looop

_looop:
            cmp byte [rsi + rax], 0
            je _exit
            mov r8b, [rsi + rax]
            mov [rdi + rax], r8b
            inc rax
            jmp _looop

_exit:
            mov r8b, 0
            mov [rdi + rax], r8b
            mov rax, rdi
            ret
