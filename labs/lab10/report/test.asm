%include 'in_out.asm'
SECTION .data
msg db "Как вас зовут:  ",0h
filename db "name.txt", 0h
msg2 db "Меня зовут: ", 0h
section .bss
name resb 255

SECTION .text
global _start
_start:
mov eax, msg ; Вывод сообщения на экран "Как вас зовут?"
call sprint
mov ecx, name ; Ввод имени
mov edx, 55
call sread

mov ecx, 0777o ; Создание файла
mov ebx, filename
mov eax, 8
int 80h
mov edx, 20
mov ecx, msg2
mov ebx, eax
mov eax,4
int 80h

mov ecx, 1 ; Открытие файла (1 - для записи).
mov ebx, filename
mov eax, 5
int 80h

mov edx, 2 ; значение смещения -- конец файла
mov ecx, 5 ; смещение на 5 байт
mov ebx, eax ; дескриптор файла
mov eax, 19 ; номер системного вызова `sys_lseek`
int 80h ; вызов ядра

mov eax, name ; в `eax` запишется количество
call slen ; введенных байтов

mov edx, eax; Запись в конец файла по длине введеной строки 
mov ecx, name; 
mov eax, 4
int 80h

call quit

