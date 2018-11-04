.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    src:
        .byte 0x45
    
    dst: 
        .ds 10

    msg1:
        .ascii "\n"
        .equ len1, .-msg1
    
    msg2:
        .ascii "Enter a hex number: "
        .equ len2, .-msg2

    msg3:
        .ascii "Binary Equivalent: "
        .equ len3, .-msg3

    
    .macro hex2bin src, dst
        lea edi, \dst
        mov rax, 0
        mov al, \src

        mov rcx, 0
        mov cx, 8

        up:
            rcl al, 1
            jc add
            mov byte ptr [edi], 0
            jmp skip
            add:
                mov byte ptr [edi], 1
            skip:
                inc edi
                dec cx
                jnz up
    .endm

.text
.global _start

_start:

    hex2bin src, dst
    display dst, 10
    display msg1, len1

    exitFn
