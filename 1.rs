fn add_segment(main: &str, mut domain: String, ibegin: usize, iend: usize) -> String {
    let chars: Vec<char> = main.chars().collect();
    if ibegin > 0 && chars[ibegin - 1] == '1' {
        domain.push(chars[ibegin - 1]);
    }
    for i in ibegin..=iend {
        if i < chars.len() {
            domain.push(chars[i]);
        }
    }
    domain + ", "
}

fn main() {
    println!("Введите строку: ");
    let mut str1 = String::new();
    std::io::stdin().read_line(&mut str1).expect("Ошибка чтения ввода");
    let str1 = str1.trim();
    
    let mut str2 = String::new();
    let chars: Vec<char> = str1.chars().collect();
    
    for i in 1..chars.len() {
        if chars[i] == '0' && chars[i-1] == '1' {
            let mut iend = i;
            while iend < chars.len() && chars[iend] == '0' {
                iend += 1;
            }
            if iend < chars.len() && chars[iend] == '1' {
                str2 = add_segment(str1, str2, i-1, iend);
            }
        }
    }
    
    if !str2.is_empty() {
        str2.truncate(str2.len() - 2);
    }
    
    println!("{}", str2);
}
