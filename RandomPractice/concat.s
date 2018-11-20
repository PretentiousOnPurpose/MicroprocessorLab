.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    str1:
        .ascii "Hello "
        .equ len1, .-str1
    
    str2:
        .ascii "World"
        .equ len2, .-str2

    .equ len3, len1+len2

    dst:
        .ds len3
    
.text

.global _start

_start:
    mov cl, len1
    lea esi, str1
    lea edi, dst

    up:
        mov al, byte ptr [esi]
        mov byte ptr [edi], al
        inc esi
        inc edi
        dec cl
        jnz up

    mov cl, len2
    lea esi, str2

    up1:
        mov al, byte ptr [esi]
        mov byte ptr [edi], al
        inc esi
        inc edi
        dec cl
        jnz up1

    display str1, len1
    display str2, len2                
    display dst, len3

    end:
    mov eax, 1
    int 0x80
