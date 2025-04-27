function addSegment(main: string, domain: string, ibegin: number, iend: number): string {
    if (ibegin > 0 && main[ibegin - 1] === '1') {
        domain += main[ibegin - 1];
    }
    for (let i = ibegin; i <= iend; i++) {
        if (i < main.length) {
            domain += main[i];
        }
    }
    return domain + ", ";
}

const str1 = prompt("Введите строку:") || "";
let str2 = "";
for (let i = 1; i < str1.length; i++) {
    if (str1[i] === '0' && str1[i - 1] === '1') {
        let iend = i;
        while (iend < str1.length && str1[iend] === '0') {
            iend++;
        }
        if (iend < str1.length && str1[iend] === '1') {
            str2 = addSegment(str1, str2, i - 1, iend);
        }
    }
}
if (str2.length > 0) {
    str2 = str2.slice(0, -2);
}
console.log(str2);
