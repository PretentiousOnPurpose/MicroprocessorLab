.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

msg:
    .ascii "Enter a string: \n"
    .equ len, .-msg

msg1:
    .ascii "Palindrome"
    .equ len1, .-msg1

msg2:
    .ascii "Not Palindrome"
    .equ len2, .-msg2

msg3:
    .ascii "Given String: "
    .equ len3, .-msg3

msg4:
    .ascii "Reversed String: "
    .equ len4, .-msg4

msg5:
    .ascii "\n"
    .equ len5, .-msg5

src:
    .ascii "lol"
    .equ lenS, .-src

src1:
    .ds 10
    .equ lenS1, lenS

dst:
    .ds 10
    .equ lenD, lenS

.macro revStr add1, add2, len
    mov cx, \len
    lea esi, \add1
    lea edi, \add2
    add edi, \len
    dec edi
    cld

    up:
        movsb
        sub edi, 2
        loop up

.endm

.text

.global _start

_start:

    revStr src, dst, lenS

    display msg3, len3
    display src, lenS
    display msg5, len5
    display msg4, len4
    display dst, lenD    
    display msg5, len5

    lea esi, src
    lea edi, dst
    mov cx, lenS
    next:
        cmpsb
        jne nxt
        dec cx
        jnz next

        display msg1, len1
        display msg5, len5
        jmp ex

    nxt:
        display msg2, len2
        display msg5, len5

    ex:
        exitFn
    
