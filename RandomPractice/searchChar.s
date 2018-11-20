.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    src:
        .ascii "Yashwanth"
        .equ len, .-src
    
.text

.global _start

_start:
    lea esi, src
    mov cl, len
    mov bl, 0
    up:
        mov al, byte ptr [esi]
        cmp al, 'a'
        jne skip

        add bl, 1

        skip:
            inc esi
            dec cl
            jnz up

    end:
        mov eax, 1
        int 0x80
        