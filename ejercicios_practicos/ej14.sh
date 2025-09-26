#!/bin/bash
#./ej14.sh alta/baja nombre apellido1 apellido2 [grupo]#

if [[ -n $1 && -n $2 && -n $3 && -n $4 ]]; then
	if [[ $1 -eq "alta" && -n $5 ]]; then
		ide= $3$4$2
		sudo adduser -u $2_$3_$4 $5 $ide
	elif [[ $1 -eq "alta" && -z $5 ]]; then
		ide= $3$4$2 
		sudo adduser -u $2_$3_$4 $ide $ide
	elif [[ $1 -eq "baja" ]]; then
		sudo deluser $2_$3_$4
	else 
	echo "Escoja una opción correcta" 
	fi
else
echo "escriba bien todos los parametros"
fi
