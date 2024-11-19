#!/bin/bash

SOURCE_DIR="$1"

if [ -z "$SOURCE_DIR" ]; then
    echo "Ошибка: Укажите директорию для сортировки."
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: Директория $SOURCE_DIR не существует."
    exit 1
fi

IMAGES_DIR="$SOURCE_DIR/Images"
DOCS_DIR="$SOURCE_DIR/Documents"

mkdir -p "$IMAGES_DIR"
mkdir -p "$DOCS_DIR"

LOG_FILE="$SOURCE_DIR/sort_files.log"

DATE=$(date '+%Y-%m-%d %H:%M:%S')

move_files() {
    local pattern="$1"
    local destination="$2"
    local description="$3"

    for file in "$SOURCE_DIR"/*.$pattern; do
        if [ -e "$file" ]; then
            mv "$file" "$destination"
            echo "[$DATE] Перемещён файл: $file -> $destination" >> "$LOG_FILE"
        fi
    done
}

echo "[$DATE] Начало сортировки файлов." >> "$LOG_FILE"
move_files "jpg" "$IMAGES_DIR" "Изображения"
move_files "png" "$IMAGES_DIR" "Изображения"
move_files "gif" "$IMAGES_DIR" "Изображения"

move_files "txt" "$DOCS_DIR" "Документы"
move_files "pdf" "$DOCS_DIR" "Документы"
move_files "docx" "$DOCS_DIR" "Документы"
echo "[$DATE] Сортировка завершена." >> "$LOG_FILE"

echo "Сортировка файлов завершена. Логи сохранены в $LOG_FILE."