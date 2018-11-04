.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

A:
    .ds 1

C:
    .ascii "5"

B:
    .ds 10

msg1:
    .ascii "Enter a Num: "
    .equ len1, .-msg1

msg2:
    .ascii "Factorial: "
    .equ len2, .-msg2

.text
.global _start

_start:
    mov rcx, 0
    display msg1, len1
    read A, 10
    mov rcx, 0
    mov ecx, A
    sub ecx, 0x30
    call fact
    mov B, eax
    
    display msg2, len2
    display B, 10
    display newline, nln
    exitFn
