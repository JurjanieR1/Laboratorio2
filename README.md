# Laboratorio 2

### Procesos-01
Corresponde a un Scrib que recibe un argumento correspondiente al ID de un proceso, y devuelve la siguiente información: nombre del proceso, ID del proceso, Nombre del proceso, Parent process ID, Usuario propietario, Porcentaje de uso de CPU al momento de correr el script, Consumo de memoria, Estado (status) y Path del ejecutable. 
 
### Procesos-02
Desarrolla una herramienta para automatizar el monitoreo de un proceso; aunque existen herramientas disponibles para observar el estado de un proceso en un momento dado, es esencial aprender a delegar tareas fácilmente automatizables a otros procesos. Se usa un script de bash que reciba como parámetro el nombre de un proceso y el comando para ejecutarlo, y luego revise periódicamente el estado del proceso; si el proceso se cierra, el script deberá volver a iniciarlo automáticamente.

#### Procesos-03
Se realizó una herramienta que permita monitorear de manera automática el consumo de CPU y memoria de un proceso. Para ello, se escribió un script que realiza las siguientes tareas: recibe como parámetro un ejecutable, ejecuta el binario recibido, lee periódicamente y registra en un archivo de registro el consumo de CPU y memoria, y al finalizar el proceso, grafica los valores a lo largo del tiempo utilizando una herramienta como gnuplot.

#### Servicios-01
Crea un servicio que monitorea los cambios(creación, modificación y eliminación) en una carpeta o directorio a elección y escribe un mensaje de log en txt con la hora, fecha y el tipo de cambio que se realiza y por último cuando se crea la unidad de servicio en systemmd entonces el servicio se ejecuta automaticamente después de reiniciar el sistema.
