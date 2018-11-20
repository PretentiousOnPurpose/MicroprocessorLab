.intel_mnemonic
.intel_syntax noprefix

.data
    msg:
        .ascii "Intel 8086 Microprocessor\n"
        .equ len, .-msg
    
    msg1:
        .ascii "Enter your message: "
        .equ len1, .-msg1
    
    msg2:
        .ascii "Your message: "
        .equ len2, .-msg2

    dst:
        .ds 100

    nxt:
        .ascii "\n"
        .equ len0, .-nxt

    .macro display add, len
        lea ecx, \add
        mov edx, \len
        mov eax, 4
        mov ebx, 1

        int 0x80    
    .endm

    .macro read add, len
        lea ecx, \add
        mov edx, \len
        mov eax, 3
        mov ebx, 2

        int 0x80
    .endm

.text
    .global _start

    _start:
        display msg, len
        display msg1, len1
        read dst, 100
        display nxt, len0
        display msg2, len2
        display dst, 100
        display nxt, len0

        mov eax, 1
        int 0x80
