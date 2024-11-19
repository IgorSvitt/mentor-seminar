#!/bin/bash

echo "Текущее значение PATH:"
echo "$PATH"

if [ -z "$1" ]; then
    echo "Ошибка: Укажите директорию в качестве аргумента."
    exit 1
fi

new_dir="$1"
if [[ ":$PATH:" != *":$new_dir:"* ]]; then
    export PATH="$PATH:$new_dir"
    echo "Директория '$new_dir' добавлена в PATH."
else
    echo "Директория '$new_dir' уже существует в PATH."
fi

echo "Новое значение PATH:"
echo "$PATH"