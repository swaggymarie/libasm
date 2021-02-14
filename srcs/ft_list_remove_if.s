global ft_list_remove_if
extern free

ft_list_remove_if:
                    cmp     rdi, 0 ;check if there is argument
                    je      exit

check_first:
                    mov     r10, [rdi]
                    cmp     r10, 0
                    je      exit

                    push    rdi
                    push    rsi
                    push    rdx
                    mov     rdi, [r10]
                    call    rdx
                    pop     rdx
                    pop     rsi
                    pop     rdi

                    cmp     rax, 0
                    jne     read_loop
                    mov     r8, [rdi] ; adress of adress of first in r8
                    mov     r9, [r8 + 8] ; adress of first->next in r9
                    mov     [rdi], r9   ;adress de l'arg =  adress de first->next
                    
                    push    rdi
                    push    rsi
                    push    rdx
                    mov     rdi, r8 ;rdi = adresse de l'arg
                    call    free
                    pop     rdx
                    pop     rsi
                    pop     rdi
                    jmp     check_first

read_loop:
        mov     r11, [r10 + 8] ;curr = r10
        cmp     r11, 0
        je      exit
        push    rdi
        push    rsi
        push    rdx
        push    r10
        push    r11
        mov     rdi, [r11]
        call    rdx
        pop     r11
        pop     r10
        pop     rdx
        pop     rsi
        pop     rdi

        cmp     rax, 0
        jne     next
 
        push    rdi
        push    rsi
        push    rdx
        mov     r13, [r11 + 8]
        mov     [r10 + 8], r13
        mov     rdi, r11
        push    r10
        push    r11
        call    free
        pop     r11
        pop     r10
        pop     rdx
        pop     rsi
        pop     rdi
        jmp     read_loop

next:
        mov     r10, r11
        jmp     read_loop

exit:
        ret
