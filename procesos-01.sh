#!/bin/bash

# Validar argumento 
if [ $# -ne 1 ]; then
    echo "$0 requiere el argumento <PID>"
    exit 1
fi

pid=$1

# Si el proceso no existe 
if ! ps -p $pid > /dev/null; then
    echo "No se encontro el proceso con PID $pid"
    exit 1
fi

# Información del proceso
nombre=$(ps -p $pid -o comm=)
ppid=$(ps -p $pid -o ppid=)
usuario=$(ps -p $pid -o user=)
cpu=$(ps -p $pid -o %cpu=)
memoria=$(ps -p $pid -o %mem=)
estado=$(ps -p $pid -o stat=)
path=$(readlink /proc/$pid/exe)

# Mostrar la información
echo "Nombre del proceso: $nombre"
echo "ID del proceso: $pid"
echo "Parent process ID: $ppid"
echo "Usuario propietario: $usuario"
echo "Porcentaje de uso de CPU: $cpu%"
echo "Consumo de memoria: $memoria%"
echo "Estado (status): $estado"
echo "Path del ejecutable: $path"
