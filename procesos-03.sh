#!/bin/bash

# Verificar que se ingresa un argumento 
if [ $# -ne 1 ]; then
    echo "$0 requiere el argumento <ejecutable>"
    exit 1
fi

ejecutable=$1
log_file="log.txt"

# Verificar ejecutable
if [ ! -x "$ejecutable" ]; then
    echo "$ejecutable no existe o no es ejecutable."
    exit 1
fi

# Función para obtener el consumo de CPU y memoria
obtener_consumo() {
    ps -p $1 -o %cpu,%mem --no-headers
}

# Función para graficar los valores del archivo de log
graficar() {
    gnuplot << EOF
set terminal png
set output 'consumo.png'
set xlabel 'Tiempo'
set ylabel 'Porcentaje'
set title 'Consumo de CPU y Memoria'
plot 'log.txt' using 1:2 with lines title 'CPU', 'log.txt' using 1:3 with lines title 'Memoria'
EOF
}

# Ejecutar
$ejecutable &

# PID del proceso
pid=$!

# Limpiar el archivo de log
> $log_file

# Ver consumo 
while kill -0 $pid > /dev/null 2>&1; do
    consumo=$(obtener_consumo $pid)
    tiempo=$(date +"%M.%S")
    echo "$tiempo $consumo" >> $log_file
    sleep 1
done

# Graficar los valores al finalizar el proceso
graficar
