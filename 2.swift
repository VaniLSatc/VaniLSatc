// Раздел 2. Задание 7.

import Foundation

// Функция searchCycle - переборный цикл, работает он так: получает значение стержня,
// и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
func searchCycle(_ str: String, _ clmn: Int, _ rwbColumns: inout Int) {
    let chars = Array(str)
    for j in 0..<chars.count-1 {
        if chars[j] == "R" && Int(String(chars[j+1])) == clmn {
            // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
            for k in 0..<chars.count-1 {
                if chars[k] == "W" && Int(String(chars[k+1])) == clmn {
                    // Перебираем стержни белого цвета по тому же принципу
                    for r in 0..<chars.count-1 {
                        if chars[r] == "B" && Int(String(chars[r+1])) == clmn {
                            // Перебираем стержни синего цвета, и, в случае успеха возвращаем номер столбца
                            rwbColumns = clmn
                        }
                    }
                }
            }
        }
    }
}

var rwbColumns = -1 // Переменная отвечает за номер стержня, на котором находятся все цвета
var output = Set<Int>() // Используем Set для хранения уникальных значений

print("Введите строку: ", terminator: "")
guard let rings = readLine() else { exit(0) }

// Примеры строк:
// R0R6B0W6W0W6B9
// R0W0B0W9W0R0B0
// B4
// W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1

let chars = Array(rings)
for i in 0..<chars.count-1 {
    // Начинаем перебирать строку
    if (chars[i] == "R" || chars[i] == "W" || chars[i] == "B") && chars[i+1].isNumber {
        // Выбираем только интересующие нас цвета
        if let column = Int(String(chars[i+1])) {
            searchCycle(rings, column, &rwbColumns)
            if rwbColumns != -1 {
                output.insert(rwbColumns) // Используем Set, чтобы сохранять только уникальные значения
            }
        }
    }
}

// Вывод результата
if rwbColumns != -1 {
    print("Количество столбцов, на которых расположены и красные, и белые, и синие кольца: \(output.count)")
} else {
    print("Нету столбцов с кольцами всех трёх цветов")
}
print()
