# Раздел 3. Задание 17.

# Функция для проверки цифр числа на делимость на 3 и суммирования подходящих цифр
def check_3(A, sum_obj):
    if A < 0:
        A = A * (-1)  # Для работы с суммой требуется проверить - положительное число или нет
    
    # Основной цикл. В нём проверяется, делится ли последняя цифра числа на 3 или нет,
    # и в случае успеха число прибавляется к сумме
    for _ in range(11):  # Аналог цикла for (int i=0;i<=10;i++) в C++
        if (A % 10) % 3 == 0:
            sum_obj['sum'] += (A % 10)
            A = A // 10
        else:
            A = A // 10

print("Введите количество чисел, а затем сами числа")

sum_obj = {'sum': 0}  # Используем словарь для передачи по ссылке (аналог указателя в C++)

try:
    A = int(input())
    
    if A >= 0:  # Проверка на корректность введённых данных
        # Цикл для ввода чисел
        for i in range(1, A + 1):
            print(f"{i} ", end='')
            n = int(input())
            check_3(n, sum_obj)
        print(f"\nРезультат: {sum_obj['sum']}")  # Вывод результата
    else:
        print("Количество чисел должно быть положительным числом!")
except ValueError:
    print("Ошибка: необходимо вводить целые числа!")
