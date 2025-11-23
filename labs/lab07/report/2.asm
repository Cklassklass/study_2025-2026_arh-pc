%include 'in_out.asm'
section .data
msg1 db 'Введите x: ',0h
msg2 db 'Введите a: ',0h
section .bss
x resb 10
a resb 10

section .text
global _start
_start:
mov eax,msg1
call sprint
mov ecx,x
mov edx,10
call sread
mov eax,x
call atoi ; Вызов подпрограммы перевода символа в число
mov [x],eax ; 

mov eax,msg2
call sprint
mov ecx,a
mov edx,10
call sread
mov eax,a
call atoi ; Вызов подпрограммы перевода символа в число
mov [a],eax ;

mov ecx, [a]
cmp ecx, 7
jae var1
mov eax, [a]
mov ebx, [x]
mul ebx
call iprintLF
 call quit
 
var1:
mov eax, [a]
sub eax, 7
call iprintLF
 call quit
