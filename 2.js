// Раздел 2. Задание 7.
// Функция searchCycle - переборный цикл, работает он так: получает значение стержня,
// и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
function searchCycle(str, clmn, rwbColumns) {
    for (let j = 0; j < str.length - 1; j++) {
        if (str[j] === 'R' && parseInt(str[j+1]) === clmn) {
            // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
            for (let k = 0; k < str.length - 1; k++) {
                if (str[k] === 'W' && parseInt(str[k+1]) === clmn) {
                    // Перебираем стержни белого цвета по тому же принципу
                    for (let r = 0; r < str.length - 1; r++) {
                        if (str[r] === 'B' && parseInt(str[r+1]) === clmn) {
                            // Перебираем стержни синего цвета, и, в случае успеха возвращаем номер столбца
                            rwbColumns.value = clmn;
                        }
                    }
                }
            }
        }
    }
}

const rwbColumns = { value: -1 }; // Объект для эмуляции передачи по ссылке
const output = new Set(); // Используем Set для хранения уникальных значений

const rings = prompt("Введите строку: ") || "";
// Примеры строк:
// R0R6B0W6W0W6B9
// R0W0B0W9W0R0B0
// B4
// W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1

// Начинаем перебирать строку
for (let i = 0; i < rings.length - 1; i++) {
    if ((rings[i] === 'R' || rings[i] === 'W' || rings[i] === 'B') && !isNaN(parseInt(rings[i+1]))) {
        // Выбираем только интересующие нас цвета
        const column = parseInt(rings[i+1]);
        searchCycle(rings, column, rwbColumns);
        if (rwbColumns.value !== -1) {
            output.add(rwbColumns.value); // Используем Set, чтобы сохранять только уникальные значения
        }
    }
}

// Вывод результата
if (rwbColumns.value !== -1) {
    console.log(`Количество столбцов, на которых расположены и красные, и белые, и синие кольца: ${output.size}`);
} else {
    console.log("Нету столбцов с кольцами всех трёх цветов");
}
