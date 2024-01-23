#!/bin/bash
#
#Script de calculadora entregable en GitHUb
# Autor: Miguel Parada Bandera
# Fecha: 23-01-2024

clear

echo "Script creado por Miguel Parada Bandera"

if [ $# -ne 2 ]; then

	echo "Cantidad incorrecta de parametros"

	exit

fi

if [ -f $1 ]; then

	echo "Fichero existente"

	exit

else

	touch $1

fi

i=1
while [ $i -le $2 ]; do

	  read -p "Operación: Op1 Op2 " op op1 op2

        echo "$op"
        echo "$op1"
        echo "$op2"


case $op in

	S)
		echo "Suma"
		let A=$(($op1+$op2))
		echo "El resultado de $op1 + $op2 es $A"
		echo $op $op1 $op2 >> $1

		;;
	R)
		echo "Resta"
		let B=$(($op1-$op2))
		echo "El resultado de $op1 - $op2 es $B"
		echo $op $op1 $op2 >> $1


		;;
	M)
		echo "Multiplicacion"
		let C=$(($op1*$op2))
		echo "El resultado de $op1 * $op2 es $C"
		echo $op $op1 $op2 >> $1


		;;
	D)
		echo "Division"
		let D=$(($op1/$op2))
		echo "El resultado de $op1 / $op2 es $D"
		echo $op $op1 $op2 >> $1

		;;
	X)
		exit
		;;
esac
i=$((i+1))
done

P=$(pwd)
echo $p/$1
cat $1
