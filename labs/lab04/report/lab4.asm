SECTION .data
	hello:	DB 'Pavlenco Serghei' ,10
	
	helloLen: EQU $-hello

SECTION .text
	Global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,hello
	mov edx,helloLen
	
	mov eax,1
	mov ebx,0
	int 80h
