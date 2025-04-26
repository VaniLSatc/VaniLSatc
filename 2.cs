using System;
using System.Collections.Generic;

class Program
{
    // Функция Search_cycle - переборный цикл, работает он так: получает из main'а значение стержня,
    // и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
    static void SearchCycle(string str, int clmn, ref int rwbColumns)
    {
        for (int j = 0; j < str.Length - 1; j++)
        {
            if (str[j] == 'R' && int.Parse(str[j + 1].ToString()) == clmn)
                // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
                for (int k = 0; k < str.Length - 1; k++)
                {
                    if (str[k] == 'W' && int.Parse(str[k + 1].ToString()) == clmn)
                        // Перебираем стержни белого цвета по тому же принципу
                        for (int r = 0; r < str.Length - 1; r++)
                        {
                            if (str[r] == 'B' && int.Parse(str[r + 1].ToString()) == clmn)
                                // Перебираем стержни синего цвета, и, в случае успеха возвращаем в main номер столбца
                                rwbColumns = clmn;
                        }
                }
        }
    }

    static void Main()
    {
        int rwbColumns = -1; // Переменная отвечает за номер стержня, на котором находятся все цвета
        HashSet<int> output = new HashSet<int>();
        Console.Write("Введите строку: ");
        // Примеры строк:
        // R0R6B0W6W0W6B9
        // R0W0B0W9W0R0B0
        // B4
        // W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
        string rings = Console.ReadLine();
        
        for (int i = 0; i < rings.Length - 1; i++)
        {
            // Начинаем перебирать строку
            if ((rings[i] == 'R' || rings[i] == 'W' || rings[i] == 'B') && char.IsDigit(rings[i + 1]))
            {
                // Выбираем только интересующие нас цвета
                int column = int.Parse(rings[i + 1].ToString());
                SearchCycle(rings, column, ref rwbColumns);
                if (rwbColumns != -1)
                    output.Add(rwbColumns); // Используем HashSet, чтобы сохранять только уникальные значения
            }
        }

        // Вывод результата
        if (rwbColumns != -1)
            Console.WriteLine($"Количество столбцов, на которых расположены и красные, и белые, и синие кольца: {output.Count}");
        else
            Console.WriteLine("Нету столбцов с кольцами всех трёх цветов");
        
        Console.WriteLine();
    }
}
