#!/bin/bash
#
#Script para mostrar por pantalla el uid y el usuario de todos los usuarios con un uid mayor o igual al introducido por parámetros
# Autor: Miguel Parada Bandera
# Fecha: 04/02/2024.

predet=1000

if [ $# -gt 1 ]; then
	echo "Cantidad incorrecta de parámetros"
	exit
fi

#Esta parte no se como terminarla, pero poniendo cualquier parámetro si funciona
if [ $# -eq 0 ]; then
	echo "Usaremos $predet en su lugar"
	[$1 -eq 1000]
fi
#

fecha=$(date +"%d-%m-%Y")
hora=$(date +"%H:%M")

echo "================================================="
echo "Informe de usuarios el dia $fecha a las $hora"

IFS=":"
while read user x uid gid g home shell ; do
        if [ $uid -ge $1 ]; then
		echo "$user - $uid"
           ((recuento++))
        fi
done < /etc/passwd

echo "Total: $recuento usuarios"
echo "================================================="

usulog=$(whoami)

echo "$fecha - $hora - El usuario $usulog ha solicitado un informe de usuarios" >> /tmp/logeventos
