# Раздел 2. Задание 7.
require 'set'
# Функция search_cycle - переборный цикл, работает он так: получает значение стержня,
# и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
def search_cycle(str, clmn, rwb_columns)
  (0..str.length-2).each do |j|
    if str[j] == 'R' && str[j+1].to_i == clmn
      # Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
      (0..str.length-2).each do |k|
        if str[k] == 'W' && str[k+1].to_i == clmn
          # Перебираем стержни белого цвета по тому же принципу
          (0..str.length-2).each do |r|
            if str[r] == 'B' && str[r+1].to_i == clmn
              # Перебираем стержни синего цвета, и, в случае успеха возвращаем номер столбца
              rwb_columns[0] = clmn
            end
          end
        end
      end
    end
  end
end

# Основной код
rwb_columns = [-1] # Используем массив для эмуляции передачи по ссылке
output = Set.new   # Используем Set для хранения уникальных значений

print "Введите строку: "
# Примеры строк:
# R0R6B0W6W0W6B9
# R0W0B0W9W0R0B0
# B4
# W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
rings = gets.chomp

(0..rings.length-2).each do |i|
  # Начинаем перебирать строку
  if ['R', 'W', 'B'].include?(rings[i]) && rings[i+1] =~ /\d/
    # Выбираем только интересующие нас цвета
    column = rings[i+1].to_i
    search_cycle(rings, column, rwb_columns)
    output.add(rwb_columns[0]) if rwb_columns[0] != -1 # Используем Set, чтобы сохранять только уникальные значения
  end
end

# Вывод результата
if rwb_columns[0] != -1
  puts "Количество столбцов, на которых расположены и красные, и белые, и синие кольца: #{output.size}"
else
  puts "Нету столбцов с кольцами всех трёх цветов"
end
puts
