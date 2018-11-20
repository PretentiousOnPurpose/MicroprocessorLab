.intel_mnemonic
.intel_syntax noprefix

.include "macro.mac"

.data
    bk:
        .ascii "\b"
        .equ len0, .-bk

    msg:
        .ascii "Counter: "
        .equ len, .-msg
    
    F:
        .byte 0
    H:
        .ds 10
    L:
        .ds 10
    C:
        .ds 10

.text
.global _start

_start:
    display msg, len
    mov rcx, 0
    mov cl, 100
    up:
        mov rax, 0
        mov rbx, 0
        mov bl, 10

        mov al, F
        div al, bl 
        add al, 0x30
        mov H, al
        add ah, 0x30
        mov L, ah

        mov al, F
        inc al
        mov F, al

        mov C, cl

        display H, 10
        display L, 10
        call delay

        display bk, len0
        display bk, len0

        mov rcx, 0
        mov cl, C

        dec cl
        jnz up        

    exitFn

delay:
    mov rax, 0
    mov rdx, 0

    mov dx, 65535
    rpt:
        mov ax, 15000
        up1:
            nop
            dec ax
            jnz up1
        
        dec dx
        jnz rpt
    
    ret
