%include 'in_out.asm' ; подключение внешнего файла

SECTION .data
intro: DB 'Вычисление выражения (8x+6)*10',0
msg: DB 'Введите x: ',0
rslt: DB 'Результат: ',0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax, intro
call sprintLF 

mov eax, msg
call sprintLF 

mov ecx, x
mov edx, 80
call sread

mov eax, rslt
call sprintLF

mov eax, x
call atoi
mov ebx, 8
imul ebx
add eax, 6
mov ebx, 10
imul ebx
call iprintLF

