// Раздел 2. Задание 7.
fun searchCycle(str: String, clmn: Int): Boolean {
    // Функция Search_cycle - переборный цикл, работает он так: получает из main'а значение стержня,
    // и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
    var red = false
    var white = false
    var blue = false

    for (i in 0 until str.length - 1) {
        if (str[i] == 'R' && str[i + 1].digitToInt() == clmn) {
            red = true
        }
        if (str[i] == 'W' && str[i + 1].digitToInt() == clmn) {
            white = true
        }
        if (str[i] == 'B' && str[i + 1].digitToInt() == clmn) {
            blue = true
        }
        if (red && white && blue) {
            return true
        }
    }
    return false
}

fun main() {
    val output = mutableSetOf<Int>()
    println("Введите строку: R0W0B0W9W0R0B0")
    // Примеры строк:
    // R0R6B0W6W0W6B9
    // R0W0B0W9W0R0B0
    // B4
    // W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
    val rings = "R0W0B0W9W0R0B0"

    for (i in 0 until rings.length - 1) {
        if ((rings[i] == 'R' || rings[i] == 'W' || rings[i] == 'B') && rings[i + 1].isDigit()) {
            val column = rings[i + 1].digitToInt()
            if (searchCycle(rings, column)) {
                output.add(column)
            }
        }
    }

    if (output.isNotEmpty()) {
        println("Количество столбцов, на которых расположены и красные, и белые, и синие кольца: ${output.size}")
    } else {
        println("Нету столбцов с кольцами всех трёх цветов")
    }
}
