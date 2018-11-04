.intel_mnemonic
.intel_syntax noprefix

.data

src:
    .byte 4, 1, 8

.macro display add, len
    lea ecx, \add
    mov edx, \len
    mov eax, 4
    mov ebx, 1

    int 0x80

.endm

.macro exit
    mov eax, 1
    int 0x80

.endm

.macro sort add, len
    mov ecx, \len
    up:
        lea esi, \add
        mov ebp, \len
        dec ebp

        up1:
            mov al, [esi]
            mov bl, [esi + 1]
            cmp al, bl
            jnc nxt

            mov [esi], bl
            mov [esi + 1], al

            nxt:
                inc esi
                dec ebp
                jnz up1

                dec ecx
                jnz up

.endm


.text
.global _start

_start:
    sort src, 3

    end: 
        nop
    
    exit
    
