.intel_mnemonic
.intel_syntax noprefix

.data

.macro exitFn
    mov eax, 1
    int 0x80

.endm

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

.macro addNo n1, n2
    lea esi, int_storage
    lea edi, \n1
    lea ebx, \n2

    mov eax, [edi]
    add eax, [ebx]
    sub eax, 0x30
    mov [esi], al
.endm

a:
    .ds 100

b: 
    .ds 100


msg1:
    .ascii "Enter A: "
    .equ len1, .-msg1

msg2:
    .ascii "Enter B: "
    .equ len2, .-msg2

msg3:
    .ascii "\n"
    .equ len3, .-msg3

msg4:
    .ascii "Sum: "
    .equ len4, .-msg4

int_storage:
    .ds 100

.text
.global _start

_start:
    display msg1, len1
    read a, 100
    display msg2, len2
    read b, 100
    addNo a, b
    display msg3, len3
    display msg4, len4
    display int_storage, 100
    display msg3, len3
    exitFn
