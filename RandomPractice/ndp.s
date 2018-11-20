.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    msg1:
        .ascii "Enter Radius: "
        .equ len1, .-msg1

    n1:
        .float 4
    n2:
        .float 3.14159
    n3:
        .float 0
    
.text

.global _start

_start:

    lea ebx, n1
    finit
    fld dword ptr [ebx + 0]
    fmul st(0), st(0)
    fld dword ptr [ebx + 4]
    fmul st(0), st(1)
    fstp dword ptr [ebx + 8]
end:
    mov eax, 1
    int 0x80
