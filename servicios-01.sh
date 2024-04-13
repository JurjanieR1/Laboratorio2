#!/bin/bash

# Directorio a monitorear
DIRECTORIO="/home/l/Documentos/lab2/"

# Archivo de log
LOG="/home/l/Documentos/lab2/log/cambios.txt"

# Monitorear el directorio en busca de cambios
inotifywait -e create -e modify -e delete -m "$DIRECTORIO" |
while read file; do
    echo "$(date '+%Y-%m-%d %H:%M:%S') $file" >> "$LOG"
done