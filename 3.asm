.section .rodata
prompt:     .string "Введите количество чисел, а затем сами числа: "
num_prompt: .string "%d-е число: "
result:     .string "Результат: %d\n"
error:      .string "Ошибка: количество чисел должно быть положительным!\n"
input_fmt:  .string "%d"

.text
.globl main

main:
    pushq %rbp
    movq %rsp, %rbp
    subq $32, %rsp          # Выделяем место для локальных переменных

    # Выводим приглашение
    movq $prompt, %rdi
    xorl %eax, %eax
    call printf

    # Считываем количество чисел
    leaq -4(%rbp), %rsi     # &count
    movq $input_fmt, %rdi
    xorl %eax, %eax
    call scanf

    # Проверка на положительное количество
    movl -4(%rbp), %ebx     # count
    testl %ebx, %ebx
    jle .Lerror

    # Инициализация суммы
    movl $0, -8(%rbp)       # sum = 0

    # Цикл ввода чисел
    movl $1, %r12d          # i = 1
.Linput_loop:
    cmpl %ebx, %r12d
    jg .Loutput

    # Выводим запрос числа
    movq $num_prompt, %rdi
    movl %r12d, %esi
    xorl %eax, %eax
    call printf

    # Считываем число
    leaq -12(%rbp), %rsi    # &current_num
    movq $input_fmt, %rdi
    xorl %eax, %eax
    call scanf

    # Обрабатываем цифры числа
    movl -12(%rbp), %eax    # Загружаем текущее число
    movl $10, %ecx          # Для деления на 10
    movl $0, %edx           # Очищаем edx перед делением

    # Берем абсолютное значение числа
    testl %eax, %eax
    jns .Lprocess_digits
    negl %eax

.Lprocess_digits:
    cmpl $0, %eax
    je .Lnext_number

    # Делим число на 10
    xorl %edx, %edx
    divl %ecx               # eax = eax/10, edx = eax%10

    # Проверяем, делится ли цифра на 3
    movl %edx, %edi         # Сохраняем цифру
    movl %edx, %eax
    movl $3, %ecx
    xorl %edx, %edx
    divl %ecx               # edx = eax % 3
    testl %edx, %edx
    jne .Lnot_divisible

    # Добавляем цифру к сумме
    addl %edi, -8(%rbp)

.Lnot_divisible:
    movl -12(%rbp), %eax    # Восстанавливаем число
    movl $10, %ecx          # Восстанавливаем делитель
    xorl %edx, %edx
    divl %ecx               # Продолжаем деление
    movl %eax, -12(%rbp)    # Сохраняем оставшуюся часть числа
    jmp .Lprocess_digits

.Lnext_number:
    incl %r12d              # Увеличиваем счетчик
    jmp .Linput_loop        # Повторяем ввод

.Lerror:
    movq $error, %rdi
    xorl %eax, %eax
    call printf
    jmp .Lexit

.Loutput:
    # Выводим результат
    movq $result, %rdi
    movl -8(%rbp), %esi     # sum
    xorl %eax, %eax
    call printf

.Lexit:
    xorl %eax, %eax
    leave
    ret
