use std::collections::HashSet;
use std::io;
// Функция search_cycle - переборный цикл, работает он так: получает из main'а значение стержня,
// и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
fn search_cycle(s: &str, clmn: i32) -> Option<i32> {
    let chars: Vec<char> = s.chars().collect();
    for j in 0..chars.len() - 1 {
        if chars[j] == 'R' && chars[j+1].to_digit(10) == Some(clmn as u32) {
            // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
            for k in 0..chars.len() - 1 {
                if chars[k] == 'W' && chars[k+1].to_digit(10) == Some(clmn as u32) {
                    // Перебираем стержни белого цвета по тому же принципу
                    for r in 0..chars.len() - 1 {
                        if chars[r] == 'B' && chars[r+1].to_digit(10) == Some(clmn as u32) {
                            // Перебираем стержни синего цвета, и, в случае успеха возвращаем номер столбца
                            return Some(clmn);
                        }
                    }
                }
            }
        }
    }
    None
}

fn main() {
    let mut rwb_columns = -1; // Переменная отвечает за номер стержня, на котором находятся все цвета
    let mut output = HashSet::new();
    println!("Введите строку: ");
    // Примеры строк:
    // R0R6B0W6W0W6B9
    // R0W0B0W9W0R0B0
    // B4
    // W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
    let mut rings = String::new();
    io::stdin().read_line(&mut rings).expect("Ошибка чтения строки");
    let rings = rings.trim();

    for i in 0..rings.len() - 1 {
        // Начинаем перебирать строку
        let current = rings.chars().nth(i).unwrap();
        let next = rings.chars().nth(i + 1).unwrap();
        
        if (current == 'R' || current == 'W' || current == 'B') && next.is_digit(10) {
            // Выбираем только интересующие нас цвета
            let column = next.to_digit(10).unwrap() as i32;
            if let Some(col) = search_cycle(rings, column) {
                rwb_columns = col;
                output.insert(col); // Используем HashSet, чтобы сохранять только уникальные значения
            }
        }
    }

    // Вывод результата
    if rwb_columns != -1 {
        println!("Количество столбцов, на которых расположены и красные, и белые, и синие кольца: {}", output.len());
    } else {
        println!("Нету столбцов с кольцами всех трёх цветов");
    }
    println!();
}
