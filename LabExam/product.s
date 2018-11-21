# Display the product of two 16 bit number taken from keyboard (STDIN)
# author: chawat
# date: 20-11-2018

.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    n1:
        .ds 100
    
    n2:
        .ds 100

    temp:
        .ds 100
    
    dst:
        .ds 100
    
    dst2:
        .ds 100
    
    msg1:
        .ascii "Enter N1: "
        .equ len1, .-msg1

    msg2:
        .ascii "Enter N2: "
        .equ len2, .-msg2
    
    msg3:
        .ascii "Product: "
        .equ len3, .-msg3

    .macro asciiToByte1 add
        mov rax, 0
        mov rbx, 0
        mov rcx, 0
        mov rdx, 0

        lea esi, \add
        up:
            mov al, byte ptr [esi]
            sub al, 10
            jz skip
            inc cl
            inc esi
            jmp up
    skip:
        lea esi, \add
        mov ebx, 10
        up1:
            mul ebx
            add al, byte ptr [esi]
            sub al, 0x30
            add eax, 0
            inc esi
            dec cl
            jnz up1

    .endm

    .macro asciiToByte2 add

        mov rax, 0
        mov rbx, 0
        mov rcx, 0
        mov rdx, 0

        lea esi, \add
        up2:
            mov al, byte ptr [esi]
            sub al, 10
            jz skip2
            inc cl
            inc esi
            jmp up2
    skip2:
        lea esi, \add
        mov ebx, 10
        up3:
            mul ebx
            add al, byte ptr [esi]
            sub al, 0x30
            add eax, 0
            inc esi
            dec cl
            jnz up3
    .endm

.text
.global _start

_start:
    display msg1, len1
    read n1, 16
    display msg2, len2
    read n2, 16


    asciiToByte1 n1

    mov temp, eax

    asciiToByte2 n2

    mov ebx, 0
    mov ebx, temp
    mul ebx

    mov rcx, 0
    mov ebx, 10
    mov cl, 0
    lea edi, dst
    t1:
        mov rdx, 0
        div ebx
        add dl, 0x30
        mov byte ptr [edi], dl        
        inc cl
        inc edi

        add eax, 0
        jz rev
        jmp t1

rev:
    lea esi, dst
    lea edi, dst2
    add edi, ecx
    dec edi
    t2:
        mov al, byte ptr [esi]
        mov byte ptr [edi], al
        dec edi
        inc esi
        dec cl
        jnz t2

    display msg3, len3
    display dst2, 100
    display newline, nln

    end:
        exitFn
