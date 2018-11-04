.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

A:
    .ascii "My Name is "
    .equ lenA, .-A

B:
    .ascii "Chawat"
    .equ lenB, .-B

.equ finalLen, lenA + lenB

C:
    .ds 50

newLine:
    .ascii "\n"
    .equ newLen, .-newLine

.text
.global _start

_start:
    mov ecx, lenA
    lea esi, A
    lea edi, C

    up:
        mov al, [esi]
        mov [edi], al
        inc edi
        inc esi
        loop up
    
    mov ecx, lenB
    lea esi, B
    up1:
        mov al, [esi]
        mov [edi], al
        inc edi
        inc esi
        loop up1
    
    display C, finalLen
    display newLine, newLen

    exitFn
    
