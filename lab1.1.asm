global _main

section .text

_main:
    push ebp
    mov  ebp, esp
    sub  esp, 44       ; выделяем 44 байта для локальных переменных (массив на 10 dword по 4 байта + dword результат), i будем хранить в регистрах-счетчиках
                   
    mov ecx, 0 ; обнуляем счётчик
    mov edx, 0 ; Сюда будем суммировать все числа

    jmp .while_head ; Идём в условие первого вайла
    
    
; цикл while (i < 10) {body}
.while_head:
    cmp ecx, 10
    jl .while_body ; Если сравнение выдало less (<), то продолжаем цикл и прыгаем в тело цикла
    ; Если оказались здесь => не перепрыгнули в тело цикла => он закончился. Обнуляем счетчик для следующего цикла и переходим в его голову
    
    mov dword [esp+10*4], edx
    mov edx, 0x0
    mov eax, 1 ; sys_exit
    mov ebx, 0 ; return code = 0
    mov ecx, 0x0
    int 0x80 ; kernel call
    leave
    ret
      
.while_body:
    mov eax, ecx
    and eax, 0x1
    cmp eax, 0x1
    jne .add_sum
    
    add ecx, 0x1
    ; Отправляемся в проверку условия выхода - в голову цикла
    jmp .while_head

.add_sum:
    add edx, dword [esp+ecx*4]
    add ecx, 0x1
    jmp .while_head