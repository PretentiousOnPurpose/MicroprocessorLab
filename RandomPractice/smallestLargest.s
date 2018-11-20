.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data

    array:
        .byte 1, 2, 3, 5, 9, 5
        .equ len, .-array
    
    msg1:
        .ascii "Greatest Number: "
        .equ len1, .-msg1
    
    msg2:
        .ascii "Smallest Number: "
        .equ len2, .-msg2

    dst1:
        .ds 10

    dst2:
        .ds 10

.text
    .global _start
    _start:

        lea esi, array
        mov al, 0
        mov bl, 0xFF
        mov cl, len

        up:
            cmp byte ptr [esi], al
            jnc big
            jmp skip

            big:
                mov al, byte ptr [esi]
                
            skip:
                inc esi
                loop up


        lea esi, array
        mov cl, len
        up1:
            cmp byte ptr [esi], bl
            jc small
            jmp skip1

            small:
                mov bl, byte ptr [esi]
                
            skip1:
                inc esi
                loop up1
            
        add al, 0x30
        add bl, 0x30
        mov dst1, al
        mov dst2, bl

        display msg1, len1
        display dst1, 10
        display newline, nln
        display msg2, len2
        display dst2, 10
        display newline, nln
        exitFn


