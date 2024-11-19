#!/bin/bash

read -p "Введите число: " num

if (( num > 0 )); then
    echo "Число $num положительное."
elif (( num < 0 )); then
    echo "Число $num отрицательное."
else
    echo "Число равно нулю."
fi

if (( num > 0 )); then
    echo "Подсчёт от 1 до $num:"
    i=1
    while (( i <= num )); do
        echo $i
        ((i++))
    done
fi