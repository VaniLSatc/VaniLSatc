<?php
function add_segment($main, $domain, $ibegin, $iend) {
    if ($ibegin > 0 && $main[$ibegin-1] == '1') {
        $domain .= $main[$ibegin-1];
    }
    for ($i = $ibegin; $i <= $iend; $i++) {
        $domain .= $main[$i];
    }
    return $domain . ", ";
}

echo "Введите строку: ";
$str1 = trim(fgets(STDIN));
$str2 = "";

for ($i = 1; $i < strlen($str1); $i++) {
    if ($str1[$i] == '0' && $str1[$i-1] == '1') {
        $iend = $i;
        while ($iend < strlen($str1) && $str1[$iend] == '0') {
            $iend++;
        }
        if ($iend < strlen($str1) && $str1[$iend] == '1') {
            $str2 = add_segment($str1, $str2, $i-1, $iend);
        }
    }
}

if (strlen($str2) > 0) {
    $str2 = substr($str2, 0, -2);
}

echo $str2 . PHP_EOL;
?>
