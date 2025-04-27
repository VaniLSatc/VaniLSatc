package main
import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func addSegment(main string, domain string, ibegin int, iend int) string {
	if ibegin > 0 && main[ibegin-1] == '1' {
		domain += string(main[ibegin-1])
	}
	for i := ibegin; i <= iend; i++ {
		if i < len(main) {
			domain += string(main[i])
		}
	}
	return domain + ", "
}

func main() {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print("Введите строку: ")
	str1, _ := reader.ReadString('\n')
	str1 = strings.TrimSpace(str1)

	var str2 string

	for i := 1; i < len(str1); i++ {
		if str1[i] == '0' && str1[i-1] == '1' {
			iend := i
			for iend < len(str1) && str1[iend] == '0' {
				iend++
			}
			if iend < len(str1) && str1[iend] == '1' {
				str2 = addSegment(str1, str2, i-1, iend)
			}
		}
	}

	if len(str2) > 0 {
		str2 = str2[:len(str2)-2]
	}

	fmt.Println(str2)
}
