fun addSegment(main: String, domain: String, ibegin: Int, iend: Int): String {
    var newDomain = domain
    if (main[ibegin - 1] == '1') newDomain += main[ibegin - 1]
    for (i in ibegin..iend) newDomain += main[i]
    return "$newDomain, "
}

fun main() {
    print("Строка: ewhufdj1101sjdkjgjesdkfngk;1230100001wfdskf011mfdv10011001100011001")
    println()
    var str1 = "ewhufdj1101sjdkjgjesdkfngk;1230100001wfdskf011mfdv10011001100011001"
    var str2 = ""

    for (i in 1 until str1.length) {
        if (str1[i] == '0' && str1[i - 1] == '1') {
            var iend = i
            while (iend < str1.length && str1[iend] == '0') iend++
            if (iend < str1.length && str1[iend] == '1') {
                str2 = addSegment(str1, str2, i - 1, iend)
            }
        }
    }

    if (str2.isNotEmpty()) {
        str2 = str2.dropLast(2)
    }

    println(str2)
}
