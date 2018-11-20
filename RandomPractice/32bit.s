.intel_mnemonic
.intel_syntax noprefix

.text
.global _start

_start:
    mov rax, 0xFFCCDDAA
    mov rbx, 0x22DDFFAA
    add rbx, rax
    end:
        mov eax, 1
        int 0x80
