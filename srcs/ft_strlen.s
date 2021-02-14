
global      _ft_strlen
            
_ft_strlen:
            mov         rax, -1
            je          _loop

_loop:
            inc rax
            cmp byte[rdi + rax], 0
            jne _loop
            ret
