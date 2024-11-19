#!/bin/bash

MEMORY_THRESHOLD=80

echo "Мониторинг ресурсов системы:"
echo "============================="
echo "1. Загрузка процессора:"
top -bn1 | grep "Cpu(s)" | awk '{print "Загрузка CPU: " $2 + $4 "%"}'

echo "2. Использование памяти:"
free -h | awk '/Mem:/ {print "Используется: " $3 " / " $2 " (" $3/$2*100 "%)"}'

echo "3. Использование дискового пространства:"
df -h | grep '^/' | awk '{print $1 ": " $5 " занято"}'

MEMORY_USAGE=$(free | awk '/Mem:/ {printf("%.0f\n", $3/$2*100)}')

if (( MEMORY_USAGE > MEMORY_THRESHOLD )); then
    echo "Внимание! Использование памяти превышает $MEMORY_THRESHOLD%."
    echo "Текущее использование памяти: $MEMORY_USAGE%."
    echo "Список процессов, потребляющих наибольшее количество памяти:"
    echo "==========================================================="
    ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 10
else
    echo "Использование памяти в норме: $MEMORY_USAGE%."
fi