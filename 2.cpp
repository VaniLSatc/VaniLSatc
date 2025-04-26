//Раздел 2. Задание 7.
#include <iostream>
#include <string>
#include <set>

using namespace std;

//Функция Search_cycle - переборный цикл, работает он так: получает из main'а значение стержня, и перебирает все цвета на условие, что кольцо каждого цвета находится на этом стержне
void Search_cycle(string str, int clmn, int* RWB_columns)
{
    for (int j=0; j < str.size()-1; j++){
        if (str[j] == 'R' && int(str[j+1] - '0') == clmn)//Перебираем стержни красного цвета, и, если видим, что красное кольцо находится на нужном стержне, идём дальше
            for (int k=0; k < str.size()-1; k++){
                if (str[k] == 'W' && int(str[k+1] - '0') == clmn)//Перебираем стержни белого цвета по тому же принципу
                    for (int r=0; r < str.size()-1; r++){
                        if (str[r] == 'B' && int(str[r+1] - '0') == clmn)(*RWB_columns)=clmn;//Перебираем стержни синего цвета, и, в случае успеха возвращаем в main номер столбца
                    }
            }
    }

}

int main()
{
    int RWB_columns = -1;//Переменная отвечает за номер стержня, на котором находятся все цвета
    set<int> output;
    cout << "Введите строку: ";
    //Примервы строк:R0R6B0W6W0W6B9
    //R0W0B0W9W0R0B0
    //B4
    //W0R3W7B0R2W9B5R1W4B8R6W0B3R9W2B7R5W1B4R8W6B2R0W3B9R1
    string rings;
    cin >> rings;
    for (int i=0; i < rings.size()-1; i++) {//Начинаем перебирать строку
        if ((rings[i] == 'R' || rings[i] == 'W' || rings[i] == 'B') and isdigit(rings[i+1])){//Выбираем только интересующие нас цвета
            int column=int(rings[i+1] - '0');
            Search_cycle(rings, column, &RWB_columns);
            if (RWB_columns != -1)output.insert(RWB_columns);//Используем контейнер set, чтобы сохранять только уникальные значения
        }
}
//Вывод результата
if (RWB_columns != -1)cout << "Количество столбцов, на которых расположены и красные, и белые, и синие кольца: " << output.size() << endl;
else cout << "Нету столбцов с кольцами всех трёх цветов";
cout << endl;
}
