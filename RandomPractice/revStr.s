.intel_mnemonic
.intel_syntax noprefix

.data
    str:
        .ascii "RAECAR"
        .equ len, .-str

    dst:
        .ds len


.text
.global _start

_start:
    lea esi, str
    lea edi, dst

    add esi, len
    dec esi

    mov cl, len
    up:
        mov al, byte ptr [esi]
        mov byte ptr [edi], al
        dec esi
        inc edi

        dec cl
        jnz up
    
    lea esi, str
    lea edi, dst

    mov dl, 0
    mov cl, len
    up1:
        mov al, byte ptr [esi]
        mov bl, byte ptr [edi]
        inc esi
        inc edi
        sub al, bl
        jnz end
        dec cl
        jnz up1

    val:
        mov dl, 99

    end:
        mov eax, 1
        int 0x80
