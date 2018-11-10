.intel_mnemonic
.intel_syntax noprefix

.data

n1:
    .float 1.0

n2:
    .float 3.14159

n3:
    .float 0.01

n4:
    .float 0.000001

sum:
    .float 0

.text
.global _start
_start:

    lea ebx, n1
    finit
    fld dword ptr [ebx + 0]
    fld dword ptr [ebx + 4]
    fld dword ptr [ebx + 8]
    fld dword ptr [ebx + 12]

    fmul st(2), st(3)
    fsqrt 

    fstp dword ptr [ebx + 8]

    mov eax, 1
    int 0x80
