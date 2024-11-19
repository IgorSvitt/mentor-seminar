#!/bin/bash

SOURCE_DIR="$1"
BACKUP_DIR="${2:-backup}"
LOG_FILE="backup.log"
DATE=$(date +%Y-%m-%d)

if [ -z "$SOURCE_DIR" ]; then
    echo "Ошибка: укажите исходную директорию для резервного копирования."
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: директория $SOURCE_DIR не существует."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "Резервное копирование начато: $(date)" > "$LOG_FILE"

file_count=0

for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        base_name=$(basename "$file")
        backup_file="$BACKUP_DIR/${base_name}_$DATE"
        cp "$file" "$backup_file"
        echo "Файл скопирован: $file -> $backup_file" >> "$LOG_FILE"
        ((file_count++))
    fi
done

echo "Резервное копирование завершено: $(date)" >> "$LOG_FILE"
echo "Всего файлов скопировано: $file_count" >> "$LOG_FILE"

echo "Резервное копирование завершено. Скопировано файлов: $file_count. Логи сохранены в $LOG_FILE."