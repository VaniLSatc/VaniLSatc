def add_segment(main_str, domain, ibegin, iend)
  domain += main_str[ibegin - 1] if ibegin > 0 && main_str[ibegin - 1] == '1'
  (ibegin..iend).each { |i| domain += main_str[i] if i < main_str.length }
  domain + ", "
end

print "Введите строку: "
str1 = gets.chomp
str2 = ""

(1...str1.length).each do |i|
  if str1[i] == '0' && str1[i - 1] == '1'
    iend = i
    while iend < str1.length && str1[iend] == '0'
      iend += 1
    end
    if iend < str1.length && str1[iend] == '1'
      str2 = add_segment(str1, str2, i - 1, iend)
    end
  end
end

str2 = str2[0...-2] unless str2.empty?
puts str2
