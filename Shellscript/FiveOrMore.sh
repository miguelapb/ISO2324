
#!/bin/bash
#
#
#
#

clear

buscar=$(ls $2)

if [ $# -ne 2 ]; then

	echo "Cantidad incorrecta de parametros"

	exit

fi
if [ -f $1 ]; then

	echo "Fichero existente"

	exit
fi
if [ ! -d $2 ]; then

	echo "El directorio no existe"

	exit

fi
if [ -z $buscar 2>/dev/null ]; then

	echo "El directorio $2  está vacío"
	exit
fi

	echo "Script creado por Miguel Parada Bandera" 


	ficheros=$( ls $2/*.txt)
	echo $ficheros
	for i in $ficheros; do
		if [ -f $i ]; then
			lineas=$(cat $i | wc -l)
			if [ $lineas -ge 5 ]; then
				echo $i
				echo $i >> $1

				palabras=$(cat $i | wc -w)
				echo "El fichero tiene $palabras palabras" > $i.q
				cat $i >> $i.q
			fi
		fi
done


numero=$(cat $1 | wc -l)

echo $numero >> $1









 




























