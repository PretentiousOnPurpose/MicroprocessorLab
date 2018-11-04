.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    src:
        .ds 10

    msg3:
        .ascii "Enter a character: "
        .equ len3, .-msg3
    
    msg1:
        .ascii "Character\n"
        .equ len1, .-msg1
    
    msg2:
        .ascii "Number\n"
        .equ len2, .-msg2
    
.text
.global _start

_start:
    display msg3, len3
    read src, 10
    mov rax, 0

    mov al, src
    sub al, 0x30

    sub al, 0
    jz num 

    cmp al, 10
    jnc char

    num:
        display msg2, len2
        jmp end

    char: display msg1, len1

    end:
        exitFn   

    