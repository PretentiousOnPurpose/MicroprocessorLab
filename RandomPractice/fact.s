.intel_mnemonic
.intel_syntax noprefix

.text
.global _start

_start:
    mov eax, 1

    mov ecx, 10

    call fact

    end:
        mov eax, 1
        int 0x80

fact:
     
    up:
        mul ecx
        dec ecx
        jnz up
    
    ret
    