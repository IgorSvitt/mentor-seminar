#!/bin/bash

BASHRC_FILE="$HOME/.bashrc"

if ! grep -q "alias ll='ls -la'" "$BASHRC_FILE"; then
    echo "Добавление алиаса ll='ls -la' в $BASHRC_FILE..."
    echo "alias ll='ls -la'" >> "$BASHRC_FILE"
else
    echo "Алиас ll уже существует в $BASHRC_FILE."
fi

if ! grep -q "bash_completion" "$BASHRC_FILE"; then
    echo "Добавление автодополнения в $BASHRC_FILE..."
    echo -e "\nif [ -f /etc/bash_completion ]; then\n    . /etc/bash_completion\nfi" >> "$BASHRC_FILE"
else
    echo "Автодополнение уже настроено в $BASHRC_FILE."
fi

echo "Применение изменений..."
source "$BASHRC_FILE"

echo "Проверка работы алиаса ll:"
ll

echo "Проверка автодополнения для cd:"
echo "Попробуйте ввести 'cd' и нажмите Tab для автодополнения директории."