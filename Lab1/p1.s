.intel_mnemonic
.intel_syntax noprefix

.data

display:
	.ascii "SP Sir \n Assistant Professor Dept. of E&C The National Institute of Engineering "
	.equ len, .-display

.text
.global _start

_start: lea rcx, display
	mov rdx, len
	
	mov rax, 4
	mov rbx, 1
	int 0x80

	mov rax, 1
	int 0x80


