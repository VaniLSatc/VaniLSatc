func addSegment(main: String, domain: String, ibegin: Int, iend: Int) -> String {
    var newDomain = domain
    let mainChars = Array(main)
    
    if ibegin > 0 && mainChars[ibegin - 1] == "1" {
        newDomain.append(mainChars[ibegin - 1])
    }
    
    for i in ibegin...iend {
        if i < mainChars.count {
            newDomain.append(mainChars[i])
        }
    }
    
    return newDomain + ", "
}

func main() {
    print("Введите строку: ", terminator: "")
    guard let str1 = readLine() else { return }
    
    var str2 = ""
    let chars = Array(str1)
    
    for i in 1..<chars.count {
        if chars[i] == "0" && chars[i-1] == "1" {
            var iend = i
            while iend < chars.count && chars[iend] == "0" {
                iend += 1
            }
            
            if iend < chars.count && chars[iend] == "1" {
                str2 = addSegment(main: str1, domain: str2, ibegin: i-1, iend: iend)
            }
        }
    }
    
    if !str2.isEmpty {
        str2.removeLast(2)
    }
    
    print(str2)
}

main()
