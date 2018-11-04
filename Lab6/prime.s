.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
A:
    .ds 10

msg1:
    .ascii "Enter a num: "
    .equ len1, .-msg1

msg2:
    .ascii "Prime\n"
    .equ len2, .-msg2

msg3:
    .ascii "Not Prime\n"
    .equ len3, .-msg3

.text
.global _start

_start:
    display msg1, len1
    read A, 10
    mov ax, 0
    mov ax, A
    sub ax, 0x30

    mov bl, 0
    mov rcx, 0
    mov rdx, 0
    mov cx, ax
    up:
        div cx
        add ah, 0
        jnz nxt

        inc bl

        nxt:
            mov ax, A
            sub ax, 0x30
            dec cx
            jnz up

    sub bl, 2
    jnz notPrime

    display msg2, len2

    notPrime:
        display msg3, len3
    
    exitFn
    