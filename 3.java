import java.util.Scanner;

// Раздел 3. Задание 17.
public class Main {

    // Функция для проверки цифр числа на делимость на 3 и суммирования подходящих цифр
    static void check3(int A, int[] sum) {
        if (A < 0) A = A * (-1); // Для работы с суммой требуется проверить - положительное число или нет
        
        // Основной цикл. В нём проверяется, делится ли последняя цифра числа на 3 или нет,
        // и в случае успеха число прибавляется к сумме
        for (int i = 0; i <= 10; i++) {
            if ((A % 10) % 3 == 0) {
                sum[0] += (A % 10);
                A = A / 10;
            } else {
                A = A / 10;
            }
        }
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите количество чисел, а затем сами числа");
        
        int[] sum = {0}; // Используем массив для эмуляции передачи по ссылке (аналог указателя в C++)
        int A = scanner.nextInt();
        
        if (A >= 0) { // Проверка на корректность введённых данных
            // Цикл для ввода чисел
            for (int i = 1; i <= A; i++) {
                System.out.print(i + " ");
                int n = scanner.nextInt();
                check3(n, sum);
            }
            System.out.println("\nРезультат: " + sum[0]); // Вывод результата
        } else {
            System.out.println("Количество чисел должно быть положительным числом!");
        }
    }
}
