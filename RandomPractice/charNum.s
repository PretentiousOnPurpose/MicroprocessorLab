.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    src:
        .ds 10
    msg1:
        .ascii "Enter character: "
        .equ len1, .-msg1
    msg2:
        .ascii "\It is a Number\n"
        .equ len2, .-msg2
    msg3:
        .ascii "\nIt is a Character\n"
        .equ len3, .-msg3
    
.text
.global _start

_start:
    display msg1, len1
    read src, 10

    mov rax, 0
    mov al, src
    sub al, 0x30

    cmp al, 0
    jc char

    cmp al, 10
    jc char

    display msg3, len3
    jmp end

    char:
        display msg2, len2
    
    end:
        exitFn
        