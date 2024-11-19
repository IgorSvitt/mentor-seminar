#!/bin/bash

greet() {
    local name="$1"
    echo "Hello, $name"
}

sum() {
    local num1="$1"
    local num2="$2"
    echo $((num1 + num2))
}

greet "World"

result=$(sum 5 7)
echo "Сумма чисел: $result"