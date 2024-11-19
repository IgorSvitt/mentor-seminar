#!/bin/bash

echo "Список всех файлов в текущей директории:"
for item in *; do
    if [ -d "$item" ]; then
        echo "$item - каталог"
    elif [ -f "$item" ]; then
        echo "$item - файл"
    else
        echo "$item - другой тип"
    fi
done

if [ -z "$1" ]; then
    echo "Ошибка: Не указано имя файла в качестве аргумента."
    exit 1
fi

if [ -e "$1" ]; then
    echo "Файл '$1' существует."
else
    echo "Файл '$1' отсутствует."
fi

echo "Информация о каждом файле:"
for item in *; do
    permissions=$(ls -ld "$item" | awk '{print $1}')
    echo "$item - Права доступа: $permissions"
done