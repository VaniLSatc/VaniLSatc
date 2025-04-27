# Раздел 2. Задание 7.

def search_cycle(s: str, clmn: int) -> int:

    red = white = blue = False
    
    for j in range(len(s) - 1):
        if s[j] == 'R' and int(s[j+1]) == clmn:
            red = True
        if s[j] == 'W' and int(s[j+1]) == clmn:
            white = True
        if s[j] == 'B' and int(s[j+1]) == clmn:
            blue = True
        if red and white and blue:
            return clmn
    return -1

str1 = input("Введите строку: ").strip()
# Примеры строк:
# R0R6B0W6W0W6B9
# R0W0B0W9W0R0B0
# B4
# W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1

# Обработка строки
output = set()

for i in range(len(str1) - 1):
    char, next_char = str1[i], str1[i+1]
    if char in {'R', 'W', 'B'} and next_char.isdigit():
        column = int(next_char)
        if search_cycle(str1, column) != -1:
            output.add(column)

# Вывод результата
if output:
    print(f"Количество столбцов с кольцами всех цветов: {len(output)}")
else:
    print("Нет столбцов с кольцами всех трех цветов")
