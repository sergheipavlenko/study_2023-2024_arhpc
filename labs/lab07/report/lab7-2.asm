%include 'in_out.asm'
section .data
msg2 db 'Наименьшее число: ',0h
A dd '41'
B dd '79'
C dd '83' 

section .bss
max resb 10

section .text
global _start
_start:

mov eax,B
call atoi
mov [B],eax 

mov ecx,[A]
mov [max],ecx

cmp ecx,[C] 
jle check_B 
mov ecx,[C] 
mov [max],ecx

check_B:
mov eax,max
call atoi 
mov [max],eax

mov ecx,[max]
cmp ecx,[B]
jle fin 
mov ecx,[B] 
mov [max],ecx

fin:
mov eax, msg2
call sprint 
mov eax,[max]
call iprintLF 
call quit 
