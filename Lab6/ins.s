.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

a:
    .byte 1

.text
.global _start

_start:
    mov al, 11
    mov bl, 10

    div bx

    display a, 1
    display newline, nln

    mov eax, 1
    int 0x80
