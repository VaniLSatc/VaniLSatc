def add_segment(main, domain, ibegin, iend):
    if ibegin > 0 and main[ibegin - 1] == '1':
        domain += main[ibegin - 1]
    for i in range(ibegin, iend + 1):
        if i < len(main):
            domain += main[i]
    return domain + ", "

str1 = input("Введите строку: ")
str2 = ""

for i in range(len(str1)):
    if i > 0 and str1[i] == '0' and str1[i - 1] == '1':
        iend = i
        while iend < len(str1) and str1[iend] == '0':
            iend += 1
        if iend < len(str1) and str1[iend] == '1':
            str2 = add_segment(str1, str2, i - 1, iend)

if len(str2) > 0:
    str2 = str2[:-2]

print(str2)
