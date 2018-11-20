.intel_mnemonic
.intel_syntax noprefix

.data
    b:
        .float -2
    a:
        .float 1
    c:
        .float 1
    d:
        .float -4
    
    del:
        .float 0
    
    r1:
        .float 0
    r2:
        .float 0
    i1:
        .float 0
    i2:
        .float 0
    
.text

.global _start

_start:
    lea ebx, a
    finit
    fld dword ptr [ebx + 4]
    fld dword ptr [ebx + 8]
    fld dword ptr [ebx + 12]
    fmul st(0), st(1)
    fmul st(0), st(2)
    fld dword ptr [ebx + 0]
    fmul st(0), st(0)
    fadd st(0), st(1)
    fsqrt
    fld dword ptr [ebx + 0]
    