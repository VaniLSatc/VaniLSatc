function check3(A, sumObj) {
    if (A < 0) A = A * (-1);
    for (let i = 0; i <= 10; i++) {
        if ((A % 10) % 3 === 0) {
            sumObj.sum += (A % 10);
            A = Math.floor(A / 10);
        } else {
            A = Math.floor(A / 10);
        }
    }
}

function main() {
    const sumObj = { sum: 0 };
    const A = parseInt(prompt("Введите количество чисел:"));
    
    if (A >= 0) {
        for (let i = 1; i <= A; i++) {
            const n = parseInt(prompt(`Введите число ${i}:`));
            check3(n, sumObj);
        }
        alert(`Результат: ${sumObj.sum}`);
    } else {
        alert("Количество чисел должно быть положительным числом!");
    }
}

main();
