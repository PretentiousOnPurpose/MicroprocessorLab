.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    ltable:
        .byte 0, 1, 4, 9, 0x16, 0x25, 0x36, 0x49, 0x64, 0x81
        .equ len1, .-ltable
    
    sdata:
        .ds 2
    
.text

.global _start

_start:
    lea ebx, ltable
    mov al, 9
    