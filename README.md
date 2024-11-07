# libasm
This school project's goal is to create a basic asm library. This branch is made for **Mac** , if you're a Linux user, please checkout to the right branch.

## Table of Contents  
[ft_strlen](#strlen) | [ft_strcpy](#strcpy) | [ft_strcmp](#strcmp) | [ft_write](https://github.com/swaggymarie/libasm/blob/mac/srcs/ft_write.s) | [ft_read](#read) | [ft_strdup](#strdup)


[ft_atoi_base](#atoi_base) | [ft_list_push_front](#list_push_front) | [ft_list_size](#list_size) | [ft_list_sort](#list_sort) | [ft_list_remove_if](#list_remove_if)

## Prenambule
This code is made in 64 bits ASM with Intel syntax. Here is a quick reminder of things to know before jumping in the pool.

### Registers
First six arguments are in rdi, rsi, rdx, rcx, r8d, r9d

| Registers                                                           | Size                   |
| ------------------------------------------------------------------- |:----------------------:|
| rax , rbx , rcx , rdx , rdi , rsi , rbp, rsp , r8 , r9 , ... , r15  | 64 bits                |
| eax, ebx, ecx, edx, edi , esi , ebp, esp, r8d, r9d, ... , r15d      | 32 bits                |
| ax, bx, cx, dx, di , si , bp, sp , r8w, r9w, ... , r15w             | 16 bits (15:0)         |
| ah, bh, ch, dh                                                      | 8 bits high (15:8)     |
| al , bl , cl , dl , dil , sil , bpl , spl , r8b, r9b, ... , r15b    | 8 bits low (7:0)       |


### Instructions
#### Move instruction and sizes
| instruction         | what does it do ?                         |       
| ------------------- |:-----------------------------------------:|       
| mov (size) dest,src | dest ←src                                 |       
| movzx dest,src      | same as move, fills the blanks with 0     |       
                                                                          
       
| Possible sizes name | size              | c equivalent |
| ------------------- |:-----------------:|:------------:|
| byte                | 1 octet           | char         |
| word                | 2 octets ou 1 mot | short        |
| dword               | 4 octets          | int          |
| qword               | 8 octets          | long         |
| tword               | 10 octets         |              |

#### Arithmetical instructions

| instruction         | What does it do ?                         |
| ------------------- |:-----------------------------------------:|       
| add op1,op2         | op1 ←op1 + op2                            |
| sub op1,op2         | op1 ←op1 −op2                             |
| neg reg             | reg ←−reg                                 |
| inc reg             | reg ←reg + 1                              |
| dec reg             | reg ←reg −1                               |
| imul dest,op        | dest ←dest ×op                            |

#### Stack
| instruction         | What does it do ?                         |
| ------------------- |:-----------------------------------------:| 
| push op             | stores op (constant/64-bit) onto the stack|
| pop op              | give last value from stack, rsp++         |

#### Bit operation
| instruction         | What does it do ?                         |
| ------------------- |:-----------------------------------------:| 
| and op1,op2         | op1 ←op1 & op2                            |
| or  op1,op2         | op1 ←op1 | op2                            |
| xor op1,op2         | op1 ←op1 ˆ op2                            |
| not reg             | reg ←  ̃reg                                |

## Tests
You can test this library with the main made in C. This whill also test the errno variable after a syscall.
Just run `make test`.
