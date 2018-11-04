.intel_mnemonic
.intel_syntax noprefix

.data

.include "macro.mac"

h:
    .ds 10

u:
    .ds 10

t:
    .ds 10

.text
.global _start

_start:

        mov al,10
        mov bl,20
        add al,bl
        
        mov cl,100
        div cl

        add al,48
        mov h,al
        mov dl,ah
        and ax,0x0
        mov al,dl
        mov cl,10
        div cl
        add al,48
        mov t,al
        add ah,48
        mov u,ah

        display t,1
        display newline, nln
        display h,1
        display newline, nln
        display u,1
        display newline, nln
        
        exitFn
