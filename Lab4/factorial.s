.intel_mnemonic
.intel_syntax noprefix

.data

msg:
    .ascii "Enter a number: "
    .equ len, .-msg

newLine:
    .ascii "\n"
    .equ len2, .-newLine

a:
    .ds 10


.macro read add, len
    lea ecx, \add
    mov edx, \len
    mov eax, 3
    mov ebx, 2

    int 0x80

.endm

.macro display add, len
    lea ecx, \add
    mov edx, \len
    mov eax, 4
    mov ebx, 1

    int 0x80

.endm

.text

.global _start

_start:
    display msg, len
    read a, 10
 
    lea esi, a
    mov ecx, [esi]

    mov eax, 0x1

    up:
        mul ecx
        loop up

    display newLine, 1
    end: 
	nop

    mov eax, 1
    int 0x80

