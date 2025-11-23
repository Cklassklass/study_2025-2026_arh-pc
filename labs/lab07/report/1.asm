%include 'in_out.asm'
section .data
msg1 db 'Программа для вычисления наименьшего числа: ',0h
A dd 84
B dd 32
C dd 77
section .bss
min resb 10

section .text
global _start
_start:

 mov eax, msg1
 call sprint
 
mov ecx,[A] ; 'ecx = A'
mov [min], ecx ; 'min = A'

cmp ecx,[B] 
jl check_C
mov ecx,[B] ; 'ecx = B'
mov [min],ecx ; 'min = B

check_C:
mov ecx,[min]
cmp ecx, [C]
jl final
mov ecx, [C]
mov [min], ecx
final:
mov eax, [min]
call iprintLF
call quit 

