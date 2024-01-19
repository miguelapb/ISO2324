#!/bin/bash
#
#Script menu con opciones de agenda
#Autor: Miguel Parada Bandera
#Fecha: 18-02-2024

clear

while true; do
echo "Opción A = Añadir una entrada"
echo "Opción B = Buscar por DNI"
echo "Opción C = Ver la agenda completa"
echo "Opción D = Eliminar todas las entradas"
echo "Opción E = Finalizar"
read -p "introduzca una opcion: " opcion


case $opcion in

	"A")
		echo "Vamos a añadir una entrada más"
		read -p "Introduzca dato:DNI " dni
		if grep "^$dni" agenda.txt 2>/dev/null; then
			echo "Error, usuario repetido"
		else
			echo "Prosiga dándome el nombre, los apellidos y la localidad"
			read -p "Introduzca dato:Nombre " nombre
			read -p "Introduzca dato:Apellidos " apellidos
			read -p "Introduzca dato:Localidad " localidad
			echo $dni:$nombre:$apellidos:$localidad >> agenda.txt

		fi
		;;
	"B")
		read -p "Introduzca dato:DNI " dni

		if grep "^$dni:" agenda.txt 2>/dev/null; then
		nombre=$( grep "^$dni" agenda.txt 2>/dev/null | cut -d ":" -f 2 )
                apellidos=$( grep "^$dni" agenda.txt 2>/dev/null | cut -d ":" -f 3 )
                localidad=$( grep "^$dni" agenda.txt 2>/dev/null | cut -d ":" -f 4 )

			echo La persona con dni numero $dni es $nombre $apellidos y vive en $localidad
		else
			echo "Error"
		fi
		;;
	"C")
		echo "vamos a ver la agenda completa"
		cat agenda.txt
		;;
	"D")
		echo "Vamos a borrar todos los datos"
		echo > agenda.txt
       		 ;;
	"E")
		exit
        ;;



esac


done
