.intel_mnemonic
.intel_syntax noprefix


.include "macro.mac"

.macro asciiToByte add
    
    lea esi, \add
    mov bl, 0
    up: mov al, [esi]
        sub al, 10
        jz done
        add bl, 1
        inc esi
        jmp up

    done:
        mov rcx, 0
        mov cl, bl
        mov rdx, 0
        mov dl, bl
        lea esi, \add
    
        mov al, 0
        mov bl, 10
        up1:
            mul bl
            add al, [esi]
            sub al, 48
            inc esi
            dec cl
            jnz up1

    sub esi, edx
    mov [esi], al

.endm

.macro byteToAscii src, dst


    mov rbx, 0
    mov rdx, 0
    mov rax, 0
    lea esi, \src
    lea edi, \dst
    mov al, [esi]
    mov bl, 100

    div bx

    sub al, 0
    jz two

    add al, 48
    mov [edi], al
    inc edi

    two:
        mov bl, 10
        mov al, dl
        div bx

        add al, 48
        mov [edi], al

        inc edi

        mov al, dl
        add al, 48
        mov [edi], al

.endm

.data


A:
    .ds 10

B: 
    .ds 10

msg1:
    .ascii "Enter Num1: "
    .equ len1, .-msg1

.text

.global _start
_start:

    display msg1, len1
    read A, 10

    mov rax, 0
    mov rbx, 0
    mov rcx, 0
    mov rdx, 0

    asciiToByte A
    

    mov rbx, 0
    mov rdx, 0
    mov rax, 0
    lea esi, A
    lea edi, B
    mov al, [esi]
    mov bl, 100

    div bx

    sub al, 0
    jz two

    add al, 48
    mov [edi], al
    inc edi

    two:
        mov rax, 0
        mov bl, 10
        mov al, dl
        div bx

        add al, 48
        mov [edi], al

        inc edi

        mov al, dl
        add al, 48
        mov [edi], al



    display B, 10
    display newline, nln

    exitFn
