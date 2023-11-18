%include 'in_out.asm'

SECTION .data
msg: DB 'Введите х: ',0
div: DB 'Результат: ',0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov ebx,eax
mul eax
mul ebx
xor edx,edx
mov ebx,2
div ebx
inc eax
mov [res],eax

mov eax,div
call sprint
mov eax,[res]
call iprintLF
call quit
