.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    src: 
        .byte 1, 2, 4, 5, 6, 7, 8
        .equ len, .-src 
    
.text

.global _start

_start:
    mov cl, len
    mov dl, 0
    mov bl, 0

    lea esi, src

    up:
        mov al, byte ptr [esi]
        rcr al, 1
        jc odd

        add dl, byte ptr [esi]
        jmp skip

        odd:
            add bl, byte ptr [esi]
        
        skip:
            inc esi
            dec cl
            jnz up

    
    end:
        mov eax, 1
        int 0x80

