.intel_mnemonic
.intel_syntax noprefix

.data

msg1:
	.ascii "Enter the data\n"
	.equ len,.-msg1

read_data:
	.ds 10

msg2:
	.ascii "Entered data: \n"
	.equ len1,.-msg2 		

msg3:

	.ascii "\n"
	
.text
.global _start

_start: 

	lea ecx, msg1
	mov edx, len 
	mov eax, 4
	mov ebx, 1
	int 0x80


	lea ecx, read_data
	mov edx, 5 
	mov eax, 3
	mov ebx, 2
	int 0x80
	
	lea ecx, msg2
	mov edx, len1 
	mov eax, 4
	mov ebx, 1
	int 0x80

	lea ecx, read_data
	mov edx, 5 
	mov eax, 4
	mov ebx, 1
	int 0x80
	
	lea ecx, msg3
	mov edx, 1 
	mov eax, 4
	mov ebx, 1
	int 0x80


	mov eax, 1
	int 0x80


