.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

src: 
    .ascii "Hello"
    .equ len, .-src

a:
    .ds 1

b:
    .ds 1

msg1:
    .ascii "Enter a character: "
    .equ len1, .-msg1

newLine:
    .ascii "\n"
    .equ newLen, .-newLine

.text
.global _start
_start:
    display msg1, len1
    read a, 1

    mov dl, 0
    lea esi, src
    lea ebp, a
    mov bl, [ebp]
    mov ecx, len
    up:
        mov al, [esi]
        sub al, bl
        jnz nxt
        inc dl
        nxt:
            inc esi
            loop up
        
    mov dh, 0
    mov b, dx

    display b, 1
    display newLine, newLen

    exitFn
