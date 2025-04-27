import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

// Раздел 2. Задание 7.
public class Main {

    // Функция searchCycle - переборный цикл, работает он так: получает значение стержня,
    // и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
    static void searchCycle(String str, int clmn, int[] rwbColumns) {
        for (int j = 0; j < str.length() - 1; j++) {
            if (str.charAt(j) == 'R' && Character.getNumericValue(str.charAt(j+1)) == clmn) {
                // Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
                for (int k = 0; k < str.length() - 1; k++) {
                    if (str.charAt(k) == 'W' && Character.getNumericValue(str.charAt(k+1)) == clmn) {
                        // Перебираем стержни белого цвета по тому же принципу
                        for (int r = 0; r < str.length() - 1; r++) {
                            if (str.charAt(r) == 'B' && Character.getNumericValue(str.charAt(r+1)) == clmn) {
                                // Перебираем стержни синего цвета, и, в случае успеха возвращаем номер столбца
                                rwbColumns[0] = clmn;
                            }
                        }
                    }
                }
            }
        }
    }

    public static void main(String[] args) {
        int[] rwbColumns = {-1}; // Используем массив для эмуляции передачи по ссылке
        Set<Integer> output = new HashSet<>(); // Используем Set для хранения уникальных значений
        Scanner scanner = new Scanner(System.in);
        
        System.out.print("Введите строку: ");
        // Примеры строк:
        // R0R6B0W6W0W6B9
        // R0W0B0W9W0R0B0
        // B4
        // W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
        String rings = scanner.nextLine().trim();
        
        for (int i = 0; i < rings.length() - 1; i++) {
            // Начинаем перебирать строку
            char current = rings.charAt(i);
            char next = rings.charAt(i+1);
            if ((current == 'R' || current == 'W' || current == 'B') && Character.isDigit(next)) {
                // Выбираем только интересующие нас цвета
                int column = Character.getNumericValue(next);
                searchCycle(rings, column, rwbColumns);
                if (rwbColumns[0] != -1) {
                    output.add(rwbColumns[0]); // Используем Set, чтобы сохранять только уникальные значения
                }
            }
        }
        
        // Вывод результата
        if (rwbColumns[0] != -1) {
            System.out.println("Количество столбцов, на которых расположены и красные, и белые, и синие кольца: " + output.size());
        } else {
            System.out.println("Нету столбцов с кольцами всех трёх цветов");
        }
        System.out.println();
    }
}
