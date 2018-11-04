.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

.equ strLen, 10

A:
    .ds strLen

B:
    .ds strLen


msg1:
    .ascii "Strings are Equal"
    .equ len1, .-msg1

msg2:
    .ascii "Strings are not equal"
    .equ len2, .-msg2

msg3:
    .ascii "Enter Str A: "
    .equ len3, .-msg3

msg4:
    .ascii "Enter Str B: "
    .equ len4, .-msg4

newLine:
    .ascii "\n"
    .equ newLen, .-newLine

.text

.global _start

_start:
    display msg3, len3
    read A, strLen

    display msg4, len4
    read B, strLen

    mov ecx, strLen
    lea esi, A
    lea ebp, B
    up:
        mov al, [esi]
        mov bl, [ebp]
        sub al, bl
        jnz ntq
        inc esi
        inc ebp
        loop up
    
        display msg1, len1
        display newLine, newLen
        jmp end

    ntq:
        display msg2, len2
        display newLine, newLen

    end:
        exitFn
        