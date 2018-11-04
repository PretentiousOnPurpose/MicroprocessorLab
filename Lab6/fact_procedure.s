.intel_mnemonic
.intel_syntax noprefix

.text
.global fact

fact:
    mov eax, 1
    up:
        mul cl
        dec cl
        jnz up
    
    ret
