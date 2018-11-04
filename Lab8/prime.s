.intel_mnemonic 
.intel_syntax noprefix

.include "macro.mac"

.data

    src:
        .ds 10

    msg1:
        .ascii "Prime\n"
        .equ len1, .-msg1

    msg2:
        .ascii "Not Prime\n"
        .equ len2, .-msg2
    
    msg3:
        .ascii "Enter a number: "
        .equ len3, .-msg3

    .macro asciiToByte src
        mov rax, 0
        mov al, \src
        sub al, 0x30
        mov src, al
    
    .endm

.text
.global _start

_start:
    display msg3, len3
    read src, 10

    asciiToByte src

    mov rax, 0
    mov rcx, 0
    mov rbx, 0
    mov rdx, 0

    mov al, src
    mov cl, src

    up:
        mov bl, cl
        div bl

        sub ah, 0
        jnz no

        inc dl
        no:
            mov rax, 0
            mov al, src
            dec cl
            sub cl, 0
            jnz up
    
    sub dl, 2
    jz prime

    display msg2, len2
    jmp end

    prime: 
        display msg1, len1
    
    end:
        exitFn
        