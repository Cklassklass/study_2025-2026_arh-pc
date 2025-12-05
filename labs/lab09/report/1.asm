%include 'in_out.asm'
SECTION .data
msg db "Результат: ",0h
section .bss
x resb 10
SECTION .text
global _start
_start:
pop ecx ; Извлекаем из стека в `ecx` количество
; аргументов (первое значение в стеке)
pop edx ; Извлекаем из стека в `edx` имя программы
; (второе значение в стеке)
sub ecx,1 ; Уменьшаем `ecx` на 1 (количество
; аргументов без названия программы)
mov esi,0 ; Используем `esi` для хранения
; промежуточных значений

next:
cmp ecx, 0h  ; Если аргументов нет, то переход к завершению программы
jz _end

pop eax ; извлекаем аргумент из стека
call atoi ; преобразуем в число
call _calcul
loop next

_end:
mov eax, msg ; вывод сообщения "Результат: "
call sprint
mov eax, esi ; записываем сумму в регистр `eax`
call iprintLF ; печать результата
call quit ; завершение программы

_calcul:
mov [x], eax
mov ebx, 12
imul ebx
sub eax, 7
add esi, eax
ret
