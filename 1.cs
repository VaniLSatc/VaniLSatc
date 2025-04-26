using System;
class Program
{
    static string AddSegment(string main, string domain, int ibegin, int iend)
    {
        if (main[ibegin - 1] == '1')
            domain += main[ibegin - 1];
        
        for (int i = ibegin; i <= iend; i++)
            domain += main[i];
        
        return domain + ", ";
    }

    static void Main()
    {
        Console.Write("Введите строку: ");
        string str1 = Console.ReadLine();
        string str2 = "";

        for (int i = 1; i < str1.Length; i++)
        {
            if (str1[i] == '0' && str1[i - 1] == '1')
            {
                int iend = i;
                while (iend < str1.Length && str1[iend] == '0')
                    iend++;
                
                if (iend < str1.Length && str1[iend] == '1')
                    str2 = AddSegment(str1, str2, i - 1, iend);
            }
        }

        if (str2.Length > 0)
            str2 = str2.Remove(str2.Length - 2, 1);
        
        Console.WriteLine(str2);
    }
}
