//Раздел 1. Задание 1.
#include <iostream>
#include <string>
using namespace std;
string add_segment(string main, string domain, int ibegin, int iend) 
{
    if (main[ibegin-1] == '1')domain= domain + main[ibegin-1];//Проверка на (1) в формуле (1)1[0]1.
    for (int i = ibegin; i <= iend; i++)//Цикл, добавляющий определённый отрезок символов из строки MAIN в строку domain.
    {
        domain = domain + main[i];
    }
    return domain + ", ";
}

int main()
{
    // Пример строки, которую можно вставить: "ndbg11000001dndng1000101sndsf101sdjfj1001afds", "ewhufdj1101sjdkjgjesdkfngk;1230100001wfdskf011mfdv10011001100011001".
    string str1, str2; //str1 - строка с изначальным набором символов, str2 - строка, которая будет использоваться для вывода.
    cout << "Введите строку: ";
    cin >> str1;
    for (int i=0; i<str1.size(); i++)
    {
        if (str1[i] == '0' and str1[i-1] == '1'){
            int iend, ibegin=i-1;
            for (int cntzero=0, pos=i;;pos++){ //Цикл, созданный для подсчёта количества нулей, идущих подряд.
                if (str1[pos] == '0')cntzero++;
                else 
                {
                    iend=pos; 
                    break;
                }
            }
            if (str1[iend] == '1')str2 = add_segment(str1,str2,ibegin,iend); //Добавляем последовательность цифр вида 1[0]1 себе в строку с помощью функции.
        }
    }
    str2[str2.size()-2]=' '; //Убираем запятую с конца.
    cout << str2 << endl; //Вывод результата.
}
