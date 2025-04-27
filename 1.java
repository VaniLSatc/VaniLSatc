import java.util.Scanner;
public class Main {
    public static String addSegment(String main, String domain, int ibegin, int iend) {
        if (ibegin > 0 && main.charAt(ibegin - 1) == '1') {
            domain += main.charAt(ibegin - 1);
        }
        for (int i = ibegin; i <= iend; i++) {
            if (i < main.length()) {
                domain += main.charAt(i);
            }
        }
        return domain + ", ";
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите строку: ");
        String str1 = scanner.nextLine();
        String str2 = "";

        for (int i = 1; i < str1.length(); i++) {
            if (str1.charAt(i) == '0' && str1.charAt(i - 1) == '1') {
                int iend = i;
                while (iend < str1.length() && str1.charAt(iend) == '0') {
                    iend++;
                }
                if (iend < str1.length() && str1.charAt(iend) == '1') {
                    str2 = addSegment(str1, str2, i - 1, iend);
                }
            }
        }

        if (str2.length() > 0) {
            str2 = str2.substring(0, str2.length() - 2);
        }

        System.out.println(str2);
    }
}
