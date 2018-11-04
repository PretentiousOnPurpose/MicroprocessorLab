.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

src:
    .byte 1, 2, 3, 4

even:
    .ds 4

odd:
    .ds 4

.text

.global _start
_start:

    mov ecx, 4
    mov dl, 0
    mov bl, 0
    lea esi, src
    lea ebp, even
    lea edi, odd

    up:
        mov al, [esi]
        rcr al, 1
        jc oddNo

        mov al, [esi]
        add bl, al
        mov [ebp], al
        inc ebp
        jmp nxt

    oddNo:
        mov al, [esi]
        add dl, al
        mov [edi], al
        inc edi
    nxt:
        inc esi        
        loop up

    end:
        nop

    exitFn
