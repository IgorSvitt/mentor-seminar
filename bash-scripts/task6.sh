#!/bin/bash

echo "Содержимое файла input.txt:"
cat input.txt

wc -l < input.txt > output.txt
echo "Результат команды wc -l записан в файл output.txt."

ls nonexistent_file 2> error.log
echo "Ошибки команды ls записаны в файл error.log."