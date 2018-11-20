.intel_mnemonic
.intel_syntax noprefix

.data
    src:
        .byte 1, 23, 22, 10, 5
        .equ len1, .-src

.text

.global _start

_start:
    mov cl, len1
    up:
        lea esi, src
        mov dl, len1
        dec dl
        
        up1:
            mov al, [esi]
            mov bl, [esi + 1]
            cmp al, bl
            jc skip

            mov [esi+1], al
            mov [esi], bl
            
            skip:
                inc esi
                dec dl
                jnz up1
            
            dec cl
            jnz up

    end:
    mov eax, 1
    int 0x80
    

