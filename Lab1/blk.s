.intel_mnemonic
.intel_syntax noprefix

.data
    src:
        .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 0
    dst:
        .ds 10

    msg:
        .ascii "\n"
        .equ len, .-msg
.macro display add, len
    lea ecx, \add
    mov edx, \len
    mov eax, 4
    mov ebx, 1
    int 0x80
.endm

.macro moveData add1, add2, len
    lea esi, \add1
    lea edi, \add2
    mov ecx, \len

    rpt:
        mov eax, [esi]
        mov [edi], al
        inc esi
        inc edi
        loop rpt

.endm

.macro exit 
    mov eax, 1
    int 0x80

.endm

.text

.global _start

_start:
    moveData src, dst, 10
    mov ebp, 10
    mov esi,0x00
    up: 
        display src[esi], 1
        display msg, len
        inc esi
        dec ebp
        jnz up   
    end: 
        mov ebp, 1

    exit
