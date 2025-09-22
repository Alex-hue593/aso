#!/bin/bash

read -p "Indica el fichero que quieres copiar: " copia
read -p "Indica el nombre de la copia: " nombre

if [[ -e $nombre ]]; then
	echo "Nombre  escojido"

elif [[ -n $copia && -n $nombre  && -f $copia  ]]; then
	cp $copia $nombre
else
	echo "error, no se han escojido parametros correctosO"

fi


