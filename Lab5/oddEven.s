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
    lea esi, src
    lea ebp, even
    lea edi, odd

    up:
        mov al, [esi]
        rcr al, 1
        jc oddNo

        mov al, [esi]
        mov [ebp], al
        inc ebp
        jmp nxt

    oddNo:
        mov al, [esi]
        mov [edi], al
        inc edi
    nxt:
        inc esi        
        loop up

    end:
        nop

    exitFn
