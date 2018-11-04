.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

src:
    .ds 10

msg1:
    .ascii "Enter a character: "
    .equ len1, .-msg1

.text

.global _start

_start:
    mov rax, 0
    mov rbx, 0
    mov rcx, 0
    mov rdx, 0

    display msg1, len1
    read src, 10

    mov al, src
    cmp al, 0x60
    jc small

    sub al, 0x20
    mov src, al
    jmp end

    small:
        add al, 0x20
        mov src, al
    
    end:
        display src, 10
        exitFn

