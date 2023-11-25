%include 'in_out.asm'
section .data
msg1 db 'Введите число х: ',0h
msg2 db 'Введите число а: ',0h
rezmsg db 'f(x) = ',0h
section .bss
a resb 80
x resb 80
rez resb 80

section .text
global _start
_start:
	mov eax,msg1
	call sprint
	mov ecx,x
	mov edx,80
	call sread

	mov eax,x
	call atoi
	mov [x],eax

	mov eax,msg2
	call sprint
	mov ecx,a
	mov edx,80
	call sread

	mov eax,a
	call atoi
	mov [a],eax

	mov eax,[x]
	cmp eax,[a]
	je x_is_a
	mov eax,[x]
	imul eax,5
	jmp calc_res
x_is_a:
	mov eax,[x]
	add eax,[a]
calc_res:
	mov [rez],eax
fin:
	mov eax,rezmsg
	call sprint
	mov eax,[rez]
	call iprintLF
	call quit
