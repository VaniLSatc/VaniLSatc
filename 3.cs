using System;

class Program
{
    // Функция check_3 - проверяет цифры числа и суммирует те, что делятся на 3
    // Для работы с суммой требуется проверить - положительное число или нет
    static void Check3(int A, ref int sum)
    {
        A = Math.Abs(A); // Берем абсолютное значение числа
        // Основной цикл. В нём проверяется, делится ли последняя цифра числа на 3 или нет,
        // и в случае успеха число прибавляется к сумме
        for (int i = 0; i <= 10; i++)
        {
            if ((A % 10) % 3 == 0)
            {
                sum += (A % 10);
                A = A / 10;
            }
            else
            {
                A = A / 10;
            }
        }
    }

    static void Main()
    {
        Console.WriteLine("Введите количество чисел, а затем сами числа");
        int sum = 0;
        int count;
        
        // Читаем количество чисел с проверкой на корректность ввода
        while (!int.TryParse(Console.ReadLine(), out count) || count < 0)
        {
            Console.WriteLine("Ошибка! Введите неотрицательное целое число:");
        }

        if (count >= 0) // Проверка на корректность введённых данных
        {
            // Цикл для ввода чисел
            for (int i = 1; i <= count; i++)
            {
                Console.Write($"{i} ");
                int number;
                // Читаем число с проверкой на корректность ввода
                while (!int.TryParse(Console.ReadLine(), out number))
                {
                    Console.WriteLine("Ошибка! Введите целое число:");
                }
                Check3(number, ref sum);
            }
            Console.WriteLine($"\nРезультат: {sum}"); // Вывод результата
        }
        else
        {
            Console.WriteLine("Количество чисел должно быть положительным числом!");
        }
        Console.WriteLine();
    }
}
