#!/bin/bash

# Verificar que ingresan dos argumentos 
if [ $# -ne 2 ]; then
    echo "$0 requiere los arguemntos <nombre_proceso> <comando>"
    exit 1
fi

nombre_proceso=$1
comando=$2

# El proceso esta en ejecucion
proceso() {
    if pgrep -x "$nombre_proceso" > /dev/null; then
        return 0 
    else
        return 1
    fi
}

# Revisar proceso
while true; do
    if ! proceso; then
        echo "El proceso $nombre_proceso no está en ejecución. Iniciando.. "
        # Iniciar proceso 
        $comando &
	else
		echo "El proceso $nombre_proceso se encuentra activo.."
    fi
    sleep 5 
done
