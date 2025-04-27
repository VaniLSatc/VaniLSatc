package main

import (
        "bufio"
        "fmt"
        "os"
        "strconv"
        "strings"
)

// Функция SearchCycle - переборный цикл, работает он так: получает из main'а значение стержня,
// и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
func SearchCycle(str string, clmn int, RWB_columns *int) {
        for j := 0; j < len(str)-1; j++ {
                if str[j] == 'R' && int(str[j+1]-'0') == clmn {
                        // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
                        for k := 0; k < len(str)-1; k++ {
                                if str[k] == 'W' && int(str[k+1]-'0') == clmn {
                                        // Перебираем стержни белого цвета по тому же принципу
                                        for r := 0; r < len(str)-1; r++ {
                                                if str[r] == 'B' && int(str[r+1]-'0') == clmn {
                                                        // Перебираем стержни синего цвета, и, в случае успеха возвращаем в main номер столбца
                                                        *RWB_columns = clmn
                                                }
                                        }
                                }
                        }
                }
        }
}

// Функция для проверки наличия значения в срезе
func contains(slice []int, val int) bool {
        for _, item := range slice {
                if item == val {
                        return true
                }
        }
        return false
}

func main() {
        var RWB_columns int = -1 // Переменная отвечает за номер стержня, на котором находятся все цвета
        var output []int          // Используем срез для хранения значений
        reader := bufio.NewReader(os.Stdin)
        fmt.Print("Введите строку: ")
        // Примеры строк:
        // R0R6B0W6W0W6B9
        // R0W0B0W9W0R0B0
        // B4
        // W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
        rings, _ := reader.ReadString('\n')
        rings = strings.TrimSpace(rings)

        for i := 0; i < len(rings)-1; i++ {
                // Начинаем перебирать строку
                if (rings[i] == 'R' || rings[i] == 'W' || rings[i] == 'B') && rings[i+1] >= '0' && rings[i+1] <= '9' {
                        // Выбираем только интересующие нас цвета
                        column, _ := strconv.Atoi(string(rings[i+1]))
                        SearchCycle(rings, column, &RWB_columns)
                        if RWB_columns != -1 && !contains(output, RWB_columns) {
                                output = append(output, RWB_columns) // Добавляем только уникальные значения
                        }
                }
        }

        // Вывод результата
        if RWB_columns != -1 {
                fmt.Printf("Количество столбцов, на которых расположены и красные, и белые, и синие кольца: %d\n", len(output))
        } else {
                fmt.Println("Нету столбцов с кольцами всех трёх цветов")
        }
        fmt.Println()
}
