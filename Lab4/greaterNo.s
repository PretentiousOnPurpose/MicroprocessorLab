.intel_mnemonic
.intel_syntax noprefix

.data

src:
    .byte 8, 1, 3, 2, 6, 8, 9, 0

.macro greater add, len
    mov al, 0
    lea esi, \add
    mov ecx, \len

    up:
        mov bl, [esi]
        cmp bl, al
        jc nxt

        mov al, bl

        nxt:
            inc esi

        loop up

.endm

.text

.global _start

_start:

    greater src, 8
    end:
        nop

    mov eax, 1
    int 0x80 
